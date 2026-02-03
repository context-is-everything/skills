---
created: '2026-01-31'
---
# GitHub Workflow Reference

Complete reference for GitHub operations used in community skills contributions.

## Token Management

### Retrieving Token from Secretstore

```python
# Python
import json
result = mcp__secretstore__secretstore_get('github-community-token')
token = json.loads(result)['secret']['value']
```

```bash
# Bash
TOKEN=$(mcp__secretstore__secretstore_get github-community-token | jq -r '.secret.value')
```

### Token Authentication Patterns

```bash
# HTTPS with token in URL (for git operations)
git clone https://${TOKEN}@github.com/context-is-everything/skills.git

# HTTPS with token in remote
git remote set-url origin https://${TOKEN}@github.com/context-is-everything/skills.git
```

```bash
# API calls with token in header
curl -H "Authorization: token ${TOKEN}" \
  https://api.github.com/repos/context-is-everything/skills
```

## Repository Operations

### Clone Repository

```bash
cd /tmp
git clone https://${TOKEN}@github.com/context-is-everything/skills.git
cd skills
```

### Configure Git Identity

```bash
git config user.email "sasha@context-is-everything.ai"
git config user.name "Sasha AI"
```

### Create Feature Branch

```bash
# Generate branch name
SKILL_NAME="my-skill"
OPERATION="contribute"  # or "update"
BRANCH="$OPERATION-$SKILL_NAME-$(date +%Y%m%d-%H%M%S)"

# Create and checkout
git checkout -b "$BRANCH"
```

### Copy Skill Files

```bash
# Source skill path
SOURCE="/home/sasha/all-project-files/deployed-md-files/docs/skills/my-skill"

# Copy to repository
cp -r "$SOURCE" ./my-skill

# For updates, remove existing first
rm -rf ./my-skill
cp -r "$SOURCE" ./my-skill
```

### Commit and Push

```bash
# Stage all changes
git add .

# Check if there are changes
if ! git diff --cached --quiet; then
    # Commit with message
    git commit -m "Add my-skill skill

    This contribution adds the my-skill skill.

    Generated via Sasha community-skills workflow."

    # Push branch
    git push -u origin "$BRANCH"
else
    echo "No changes to commit"
fi
```

## Pull Request Creation

### Create PR via API

```bash
# PR details
TITLE="Add my-skill skill"
BODY="## Overview

This PR adds the my-skill skill to the community repository.

### Testing
- ✅ Skill validated
- ✅ All files included

🤖 Generated via Sasha community-skills workflow"

# Create PR
curl -X POST \
  -H "Authorization: token ${TOKEN}" \
  -H "Accept: application/vnd.github.v3+json" \
  https://api.github.com/repos/context-is-everything/skills/pulls \
  -d "{
    \"title\": \"${TITLE}\",
    \"body\": \"${BODY}\",
    \"head\": \"${BRANCH}\",
    \"base\": \"main\"
  }"
```

### PR Response

```json
{
  "html_url": "https://github.com/context-is-everything/skills/pull/123",
  "number": 123,
  "state": "open",
  "title": "Add my-skill skill",
  "user": {
    "login": "sasha-community-bot"
  }
}
```

Extract PR URL:

```bash
PR_URL=$(curl ... | jq -r '.html_url')
echo "Pull request created: $PR_URL"
```

## Complete Workflow Example

### Contributing a New Skill

```bash
#!/bin/bash
set -e

# Configuration
SKILL_PATH="/home/sasha/all-project-files/deployed-md-files/docs/skills/my-skill"
SKILL_NAME=$(basename "$SKILL_PATH")
TOKEN=$(mcp__secretstore__secretstore_get github-community-token | jq -r '.secret.value')

# Clone repository
cd /tmp
rm -rf skills
git clone "https://${TOKEN}@github.com/context-is-everything/skills.git"
cd skills

# Configure git
git config user.email "sasha@context-is-everything.ai"
git config user.name "Sasha AI"

# Create branch
BRANCH="contribute-${SKILL_NAME}-$(date +%Y%m%d-%H%M%S)"
git checkout -b "$BRANCH"

# Copy skill
cp -r "$SKILL_PATH" "./$SKILL_NAME"

# Commit
git add .
git commit -m "Add $SKILL_NAME skill"

# Push
git remote set-url origin "https://${TOKEN}@github.com/context-is-everything/skills.git"
git push -u origin "$BRANCH"

# Create PR
PR_URL=$(curl -s -X POST \
  -H "Authorization: token ${TOKEN}" \
  -H "Accept: application/vnd.github.v3+json" \
  https://api.github.com/repos/context-is-everything/skills/pulls \
  -d "{
    \"title\": \"Add $SKILL_NAME skill\",
    \"body\": \"Adding new skill to community repository\",
    \"head\": \"$BRANCH\",
    \"base\": \"main\"
  }" | jq -r '.html_url')

echo "✅ Pull request created: $PR_URL"
```

### Updating an Existing Skill

```bash
#!/bin/bash
set -e

# Configuration
SKILL_PATH="/home/sasha/all-project-files/deployed-md-files/docs/skills/existing-skill"
SKILL_NAME=$(basename "$SKILL_PATH")
TOKEN=$(mcp__secretstore__secretstore_get github-community-token | jq -r '.secret.value')

# Clone repository
cd /tmp
rm -rf skills
git clone "https://${TOKEN}@github.com/context-is-everything/skills.git"
cd skills

# Configure git
git config user.email "sasha@context-is-everything.ai"
git config user.name "Sasha AI"

# Create branch
BRANCH="update-${SKILL_NAME}-$(date +%Y%m%d-%H%M%S)"
git checkout -b "$BRANCH"

# Remove old version and copy new
rm -rf "./$SKILL_NAME"
cp -r "$SKILL_PATH" "./$SKILL_NAME"

# Commit only if changes exist
git add .
if ! git diff --cached --quiet; then
    git commit -m "Update $SKILL_NAME skill"

    # Push
    git remote set-url origin "https://${TOKEN}@github.com/context-is-everything/skills.git"
    git push -u origin "$BRANCH"

    # Create PR
    PR_URL=$(curl -s -X POST \
      -H "Authorization: token ${TOKEN}" \
      -H "Accept: application/vnd.github.v3+json" \
      https://api.github.com/repos/context-is-everything/skills/pulls \
      -d "{
        \"title\": \"Update $SKILL_NAME skill\",
        \"body\": \"Updating existing skill with improvements\",
        \"head\": \"$BRANCH\",
        \"base\": \"main\"
      }" | jq -r '.html_url')

    echo "✅ Pull request created: $PR_URL"
else
    echo "⚠️ No changes detected"
fi
```

## Error Handling

### Common Errors

```bash
# Permission denied
# Solution: Verify token has push access
curl -H "Authorization: token ${TOKEN}" \
  https://api.github.com/repos/context-is-everything/skills | jq '.permissions'

# Branch already exists
# Solution: Use unique branch name with timestamp
BRANCH="contribute-skill-$(date +%Y%m%d-%H%M%S)"

# No changes to commit
# Solution: Check if skill was actually modified
git status
git diff

# Token not found
# Solution: Verify secretstore configuration
mcp__secretstore__secretstore_list | grep github-community-token
```

### Verification Steps

```bash
# 1. Verify token works
curl -H "Authorization: token ${TOKEN}" https://api.github.com/user

# 2. Verify repository access
curl -H "Authorization: token ${TOKEN}" \
  https://api.github.com/repos/context-is-everything/skills

# 3. Verify push permissions
curl -H "Authorization: token ${TOKEN}" \
  https://api.github.com/repos/context-is-everything/skills | jq '.permissions.push'

# Should return: true
```

## Cleanup

```bash
# Remove temporary repository
rm -rf /tmp/skills

# Clear git credentials (optional, for security)
rm -f ~/.git-credentials
```
