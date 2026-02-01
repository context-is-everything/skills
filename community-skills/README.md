![Community Skills banner](https://www.context-is-everything.com/assets/community-skills-hero.png)

# Community Skills

Contribute and update skills in the context-is-everything/skills community repository. Automates the complete GitHub workflow — cloning, branching, committing, pushing, and PR creation — so you can share skills without manual git operations.

**Category:** Development

---

## How to Use — Just Ask

Say any of these to Claude and the skill activates:

> **"Contribute this skill to the community repo"**

> **"Share my skill with the community"**

> **"Publish this skill..."**

> **"Update the cool-charts skill in the community repo"**

> **"Push my changes to the community skills repository"**

### Worked Examples

**Contributing a new skill:**
> "Contribute my new debugging skill to the community repo"

Validates the skill structure (SKILL.md, references/), creates a feature branch, commits the files, pushes, and opens a PR with a formatted description.

**Updating an existing skill:**
> "Update the cool-charts skill in the community repo with my improvements"

Clones the latest version, applies your changes, and creates a PR with a clear diff summary showing what changed and why.

**First-time sharing:**
> "I've built a skill for generating API documentation — share it with the Sasha community"

Walks through the contribution workflow: validates the skill, checks for naming conflicts, creates the PR, and provides the link for review.

**Bug fixes:**
> "Push fixes to the knowledge-graph-builder skill"

Creates an update branch, stages only the changed files, and submits a focused PR referencing the specific issues addressed.

**From scratch:**
> "I want to create a new community skill for code review — help me build and publish it"

Guides you through skill creation (SKILL.md structure, references, examples), then handles the full contribution workflow to get it into the repo.

---

## What You Get

Automated handling of the full GitHub contribution workflow:

1. **Validation** — checks your skill has the right structure
2. **Authentication** — retrieves GitHub token from secretstore
3. **Branch management** — creates a clean feature branch
4. **Commit** — stages and commits with a descriptive message
5. **Push** — pushes to the community repo
6. **PR creation** — opens a pull request with formatted description

## Skill Structure

Every skill in the community repo follows this layout:

```
skill-name/
├── SKILL.md          # Skill definition with YAML frontmatter
├── README.md         # Public documentation with examples
└── references/       # Supporting reference files
```

## Installation

This skill is available in Sasha Studio environments. To use manually:

```bash
git clone https://github.com/context-is-everything/skills.git /tmp/cie-skills
cp -r /tmp/cie-skills/community-skills .claude/skills/
```

## Links

- [Community page](https://www.context-is-everything.com/community) · [Full skill documentation](SKILL.md)
