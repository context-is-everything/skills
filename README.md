# Community Skills for Sasha Studio

A community-maintained collection of [Agent Skills](https://docs.anthropic.com/en/docs/agents-and-tools/claude-code/skills) built with and for [Sasha Studio](https://www.context-is-everything.com) -- the AI knowledge management platform by Context is Everything.

## What is Sasha Studio?

Sasha Studio is an AI knowledge management system that transforms decades of institutional knowledge into an instantly accessible, conversational interface. It connects to your organisation's existing documents, processes, and expertise -- then makes all of it available through a natural-language AI assistant.

Key capabilities:
- **Conversational access** to organisational knowledge across documents, projects, and history
- **Skills system** that captures repeatable expertise as reusable, shareable procedures
- **Knowledge layers** spanning company foundations, staff expertise, products, markets, domain knowledge, and active projects
- **Secure deployment** with role-based access, encrypted API tokens, and compliance-aware configurations

Sasha Studio is built on Anthropic's Claude and uses the [Agent Skills](https://docs.anthropic.com/en/docs/agents-and-tools/claude-code/skills) specification to extend what the AI can do.

## What Are Skills?

Skills are documented procedures that teach Claude how to perform specific tasks consistently. Think of them as playbooks that encode organisational expertise into a format Claude can follow.

When you ask Sasha a question, it automatically searches for relevant skills and applies the matching methodology. This means:

- **Knowledge preservation** -- expertise survives when team members move on
- **Consistency** -- the same proven approach every time
- **Faster onboarding** -- new team members get expert-level guidance immediately
- **Continuous improvement** -- skills are refined over time as teams learn

## Skill Structure

A skill is a folder containing a `SKILL.md` file. That's the only required file.

```
my-skill/
├── SKILL.md              # Required -- the skill definition
├── scripts/              # Optional -- supporting scripts
│   └── helper.py
└── reference/            # Optional -- reference material
    └── guide.md
```

### SKILL.md Format

Every skill starts with YAML frontmatter followed by Markdown instructions:

```markdown
---
name: my-skill-name
description: >
  What this skill does and when Claude should use it.
  Be specific about triggers and use cases.
category: operations
icon: Terminal
---

# My Skill Name

## When to Use
- Situation where this skill applies
- Another trigger condition

## Instructions

Step-by-step procedure Claude will follow...

## Examples

Concrete examples of inputs and expected outputs...
```

**Required fields:**

| Field | Description |
|-------|-------------|
| `name` | Lowercase with hyphens, must match the folder name (e.g., `my-skill-name`) |
| `description` | What the skill does, when to use it, and real-world triggers |

**Optional fields:**

| Field | Description |
|-------|-------------|
| `category` | Grouping label (e.g., `security`, `operations`, `documentation`) |
| `icon` | Visual identifier (e.g., `ShieldWarning`, `FileText`, `Database`) |
| `license` | License name or reference to a LICENSE file |
| `metadata` | Custom key-value pairs |

## Using These Skills

### With Claude Code

Copy a skill folder into your project's `.claude/skills/` directory:

```bash
# Clone this repository
git clone https://github.com/context-is-everything/skills.git

# Copy a skill into your project
cp -r skills/skill-name /path/to/your/project/.claude/skills/
```

Claude Code will automatically discover and use skills from `.claude/skills/`.

### With Sasha Studio

Skills placed in Sasha's configured skills directory are automatically available to all users in that instance. Consult your Sasha Studio deployment documentation for the specific path.

## Contributing

We welcome community contributions. To submit a skill:

1. **Fork** this repository
2. **Create a folder** for your skill with a descriptive, lowercase-hyphenated name
3. **Add a `SKILL.md`** with the required frontmatter and clear instructions
4. **Test your skill** -- verify Claude follows it correctly and produces consistent results
5. **Submit a pull request** with a brief description of what the skill does and why it's useful

### Guidelines

- **One skill per folder** -- keep skills focused on a single task or workflow
- **Be specific** -- vague instructions produce vague results; include concrete steps, examples, and expected outputs
- **Include triggers** -- the `description` field should make it obvious when Claude should activate the skill
- **Test thoroughly** -- run your skill through several scenarios before submitting
- **Document dependencies** -- if your skill requires external tools or APIs, state that clearly
- **Respect licensing** -- this repository uses GPL-3.0; contributed skills must be compatible

### What Makes a Good Skill?

- Solves a real, recurring problem
- Instructions are clear enough that a person unfamiliar with the task could follow them
- Includes examples of expected input and output
- Handles edge cases and error conditions
- Is tested across multiple scenarios

## Repository Structure

```
skills/
├── README.md             # This file
├── LICENSE               # GPL-3.0
└── skill-name/           # Each skill in its own folder
    └── SKILL.md
```

## Learn More

- [Sasha Studio](https://www.context-is-everything.com) -- AI knowledge management platform
- [Agent Skills Specification](https://docs.anthropic.com/en/docs/agents-and-tools/claude-code/skills) -- Anthropic's official skills documentation
- [Claude Code](https://docs.anthropic.com/en/docs/agents-and-tools/claude-code/overview) -- the CLI tool that powers the skills system

## License

This repository is licensed under the [GNU General Public License v3.0](LICENSE).
