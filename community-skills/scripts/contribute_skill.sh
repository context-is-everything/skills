#!/bin/bash
# Community Skills Contribution Script
# Automates the workflow for contributing skills to context-is-everything/skills

set -e

# Configuration
REPO_URL="https://github.com/context-is-everything/skills.git"
REPO_NAME="skills"
WORK_DIR="/tmp"
TOKEN_NAME="github-community-token"

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Usage information
usage() {
    cat << EOF
Usage: $0 <operation> <skill-path> [options]

Operations:
  contribute    Add a new skill to the community repository
  update        Update an existing skill in the community repository

Arguments:
  skill-path    Path to the skill directory (e.g., /path/to/my-skill/)

Options:
  --branch      Branch name (default: auto-generated)
  --message     Commit message (default: auto-generated)

Examples:
  $0 contribute /home/sasha/all-project-files/deployed-md-files/docs/skills/my-skill
  $0 update /home/sasha/all-project-files/deployed-md-files/docs/skills/existing-skill --branch fix-typo

Environment Variables:
  GITHUB_TOKEN  GitHub token (if not using secretstore)

EOF
    exit 1
}

# Logging functions
log_info() {
    echo -e "${GREEN}✓${NC} $1"
}

log_warn() {
    echo -e "${YELLOW}⚠${NC} $1"
}

log_error() {
    echo -e "${RED}✗${NC} $1"
}

# Get GitHub token from secretstore or environment
get_github_token() {
    if command -v mcp__secretstore__secretstore_get &> /dev/null; then
        TOKEN=$(mcp__secretstore__secretstore_get "$TOKEN_NAME" 2>/dev/null | jq -r '.secret.value' 2>/dev/null)
        if [ -n "$TOKEN" ] && [ "$TOKEN" != "null" ]; then
            echo "$TOKEN"
            return 0
        fi
    fi

    if [ -n "$GITHUB_TOKEN" ]; then
        echo "$GITHUB_TOKEN"
        return 0
    fi

    log_error "GitHub token not found in secretstore or environment"
    log_error "Set GITHUB_TOKEN environment variable or configure secretstore"
    exit 1
}

# Validate skill directory
validate_skill() {
    local skill_path="$1"

    if [ ! -d "$skill_path" ]; then
        log_error "Skill directory not found: $skill_path"
        exit 1
    fi

    if [ ! -f "$skill_path/SKILL.md" ]; then
        log_error "SKILL.md not found in: $skill_path"
        exit 1
    fi

    log_info "Skill directory validated: $skill_path"
}

# Extract skill name from path
get_skill_name() {
    basename "$1"
}

# Clone or update repository
setup_repository() {
    local token="$1"
    local repo_path="$WORK_DIR/$REPO_NAME"

    if [ -d "$repo_path" ]; then
        log_info "Repository exists, updating..."
        cd "$repo_path"
        git fetch origin
        git checkout main
        git pull origin main
    else
        log_info "Cloning repository..."
        cd "$WORK_DIR"
        git clone "https://${token}@github.com/context-is-everything/skills.git"
        cd "$REPO_NAME"
    fi

    # Configure git
    git config user.email "sasha@context-is-everything.ai"
    git config user.name "Sasha AI"

    log_info "Repository ready at: $repo_path"
}

# Create feature branch
create_branch() {
    local branch_name="$1"

    git checkout -b "$branch_name"
    log_info "Created branch: $branch_name"
}

# Copy skill files
copy_skill_files() {
    local source_path="$1"
    local skill_name="$2"
    local dest_path="$skill_name"

    # Remove existing if updating
    if [ -d "$dest_path" ]; then
        log_warn "Existing skill found, will be updated"
        rm -rf "$dest_path"
    fi

    # Copy skill directory
    cp -r "$source_path" "$dest_path"

    log_info "Skill files copied to: $dest_path"
}

# Commit changes
commit_changes() {
    local commit_message="$1"

    git add .

    if git diff --cached --quiet; then
        log_warn "No changes to commit"
        return 1
    fi

    git commit -m "$commit_message"
    log_info "Changes committed"
    return 0
}

# Push branch
push_branch() {
    local token="$1"
    local branch_name="$2"

    git remote set-url origin "https://${token}@github.com/context-is-everything/skills.git"
    git push -u origin "$branch_name"

    log_info "Branch pushed: $branch_name"
}

# Create pull request
create_pull_request() {
    local token="$1"
    local branch_name="$2"
    local title="$3"
    local body="$4"

    local pr_url=$(curl -s -X POST \
        -H "Authorization: token $token" \
        -H "Accept: application/vnd.github.v3+json" \
        https://api.github.com/repos/context-is-everything/skills/pulls \
        -d "{
            \"title\": \"$title\",
            \"body\": \"$body\",
            \"head\": \"$branch_name\",
            \"base\": \"main\"
        }" | jq -r '.html_url')

    if [ "$pr_url" != "null" ] && [ -n "$pr_url" ]; then
        log_info "Pull request created: $pr_url"
        echo "$pr_url"
    else
        log_error "Failed to create pull request"
        exit 1
    fi
}

# Generate commit message
generate_commit_message() {
    local operation="$1"
    local skill_name="$2"

    case "$operation" in
        contribute)
            echo "Add $skill_name skill

This contribution adds the $skill_name skill to the community repository.

Generated via Sasha community-skills workflow."
            ;;
        update)
            echo "Update $skill_name skill

This update improves the $skill_name skill.

Generated via Sasha community-skills workflow."
            ;;
    esac
}

# Generate PR body
generate_pr_body() {
    local operation="$1"
    local skill_name="$2"
    local skill_path="$3"

    # Count files
    local file_count=$(find "$skill_path" -type f | wc -l)
    local line_count=$(find "$skill_path" -type f -name "*.md" -o -name "*.py" -o -name "*.sh" | xargs wc -l 2>/dev/null | tail -1 | awk '{print $1}')

    case "$operation" in
        contribute)
            cat << EOF
## New Skill Contribution

This PR adds the **$skill_name** skill to the community repository.

### Skill Details

- **Name:** $skill_name
- **Files:** $file_count files
- **Documentation:** $line_count lines

### What This Skill Does

See SKILL.md for complete description and usage instructions.

### Testing

- ✅ Skill structure validated
- ✅ SKILL.md properly formatted
- ✅ All required files included

---

🤖 Generated via Sasha [community-skills](https://github.com/context-is-everything/skills) workflow
EOF
            ;;
        update)
            cat << EOF
## Skill Update

This PR updates the **$skill_name** skill.

### Changes

- Updated skill files
- Current file count: $file_count files
- Current documentation: $line_count lines

### Testing

- ✅ Skill structure validated
- ✅ SKILL.md properly formatted
- ✅ All changes tested

---

🤖 Generated via Sasha [community-skills](https://github.com/context-is-everything/skills) workflow
EOF
            ;;
    esac
}

# Main workflow
main() {
    local operation="$1"
    local skill_path="$2"
    local custom_branch=""
    local custom_message=""

    # Parse arguments
    shift 2
    while [[ $# -gt 0 ]]; do
        case "$1" in
            --branch)
                custom_branch="$2"
                shift 2
                ;;
            --message)
                custom_message="$2"
                shift 2
                ;;
            *)
                log_error "Unknown option: $1"
                usage
                ;;
        esac
    done

    # Validate operation
    if [[ "$operation" != "contribute" && "$operation" != "update" ]]; then
        log_error "Invalid operation: $operation"
        usage
    fi

    # Validate skill
    validate_skill "$skill_path"

    # Get skill name
    local skill_name=$(get_skill_name "$skill_path")

    # Get GitHub token
    log_info "Retrieving GitHub token..."
    local token=$(get_github_token)

    # Generate branch name
    local branch_name="${custom_branch:-${operation}-${skill_name}-$(date +%Y%m%d-%H%M%S)}"

    # Setup repository
    setup_repository "$token"

    # Create branch
    create_branch "$branch_name"

    # Copy skill files
    copy_skill_files "$skill_path" "$skill_name"

    # Generate commit message
    local commit_message="${custom_message:-$(generate_commit_message "$operation" "$skill_name")}"

    # Commit changes
    if ! commit_changes "$commit_message"; then
        log_warn "Exiting without creating PR"
        exit 0
    fi

    # Push branch
    push_branch "$token" "$branch_name"

    # Generate PR details
    local pr_title
    case "$operation" in
        contribute)
            pr_title="Add $skill_name skill"
            ;;
        update)
            pr_title="Update $skill_name skill"
            ;;
    esac

    local pr_body=$(generate_pr_body "$operation" "$skill_name" "$skill_path")

    # Create PR
    local pr_url=$(create_pull_request "$token" "$branch_name" "$pr_title" "$pr_body")

    echo ""
    log_info "✨ Success! Pull request created"
    echo ""
    echo "   View PR: $pr_url"
    echo ""
}

# Entry point
if [ $# -lt 2 ]; then
    usage
fi

main "$@"
