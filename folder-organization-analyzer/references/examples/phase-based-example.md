---
created: '2026-01-31'
---
# Folder Organization Analysis - Example Output
**Example Type:** Phase-Based Hierarchy Recommendation
**Folder:** `/home/sasha/all-project-files/deployed-md-files/docs/exec-assessment-johnson/`
**Analysis Date:** 2024-01-31
**Analyzed by:** Sasha - Folder Organization Analyzer Skill

---

## 📊 Current State Summary

**Overview:**
- Total files: 34
- Total subdirectories: 3
- File types: 29 .md, 3 .pdf, 2 .docx
- Directory depth: 2 levels
- Date range: 2023-12-01 to 2024-01-30

**Detected Patterns:**
- ✅ 85% of files have date prefixes (YYYY-MM-DD format)
- ✅ Version indicators present: `v1`, `v2`, `draft`, `final`
- ✅ Workflow stages evident: "preliminary", "analysis", "draft", "final report"
- ✅ Clear temporal progression from December to January
- ⚠️ Mixed organization: dated files at root, three subdirectories with unclear purpose
- ⚠️ File naming inconsistent between "data collection" and "final deliverables"

**Chaos Signals:**
- Subdirectory names don't clearly indicate purpose: `Misc/`, `Sarah's Stuff/`, `Old Files/`
- 4 files with unclear status (draft? final? archived?)
- Potential duplication: multiple versions of similar documents without clear latest version
- 6 files in `Old Files/` that may be duplicates of newer versions

**Content Themes:**
- **Primary theme:** Executive assessment for Sarah Johnson, CEO candidate
- **Secondary theme:** Leadership evaluation and organizational fit analysis
- **Document types:** Interview notes, assessment frameworks, competency analysis, behavioral observations, recommendations, draft reports, final deliverables
- **Workflow evident:** Research → Interviews → Analysis → Synthesis → Drafting → Finalization

**File Naming Patterns:**
- 85% of files: `YYYY-MM-DD-[description].md` or `YYYY-MM-DD-[description]-[status].md`
- 10% of files: `[description]-v[number].md`
- 5% of files: unclear or inconsistent naming

---

## 🎯 Recommended Organizational Paradigm

### ⭐ PRIMARY RECOMMENDATION: Phase-Based Hierarchy
**Score: 82/100**

**Why this fits:**
1. **Clear sequential workflow** - Research → Data Collection → Analysis → Drafting → Final Deliverables
2. **Temporal progression evident** - 85% of files dated, showing clear timeline
3. **Version control needs** - Multiple drafts and versions indicate iterative workflow
4. **Deliverable-focused project** - End goal is final report and recommendations
5. **Team handoffs** - Different team members work on different phases
6. **Need to separate WIP from completed work** - Stakeholders ask "Is this the final version?"

**Proposed structure:**
```
exec-assessment-johnson/
├── 1-research/                      # Initial background and planning
│   ├── project-brief.md
│   ├── assessment-framework.md
│   ├── competency-model.md
│   ├── role-requirements.md
│   └── background-research.md
├── 2-data-collection/               # Interviews and observations
│   ├── interview-prep-questions.md
│   ├── 2023-12-05-interview-sarah-initial.md
│   ├── 2023-12-12-interview-sarah-followup.md
│   ├── 2023-12-15-reference-call-john-smith.md
│   ├── 2023-12-18-reference-call-jane-doe.md
│   ├── 2024-01-08-behavioral-observations.md
│   └── interview-notes-summary.md
├── 3-analysis/                      # Processing and evaluation
│   ├── competency-ratings.md
│   ├── leadership-style-analysis.md
│   ├── strengths-assessment.md
│   ├── development-areas.md
│   ├── cultural-fit-analysis.md
│   ├── decision-making-evaluation.md
│   └── risk-factors.md
├── 4-synthesis/                     # Synthesis and insights
│   ├── key-findings.md
│   ├── overall-evaluation.md
│   ├── fit-for-role-assessment.md
│   ├── recommendations.md
│   └── development-plan.md
├── 5-drafts/                        # Report drafting
│   ├── 2024-01-15-executive-summary-draft.md
│   ├── 2024-01-18-full-report-draft-v1.md
│   ├── 2024-01-22-full-report-draft-v2.md
│   ├── 2024-01-25-recommendations-section-draft.md
│   └── peer-review-feedback.md
├── 6-final/                         # Completed deliverables
│   ├── 2024-01-30-executive-summary-FINAL.md
│   ├── 2024-01-30-full-assessment-report-FINAL.md
│   ├── 2024-01-30-recommendations-brief-FINAL.md
│   └── 2024-01-30-development-plan-FINAL.md
├── 7-archive/                       # Historical and superseded materials
│   ├── old-versions/
│   └── exploratory-notes/
├── source-materials/                # Reference documents and frameworks
│   ├── assessment-templates.pdf
│   ├── competency-framework.pdf
│   └── industry-benchmarks.docx
├── citations.md                     # Master citation file
└── project-overview.md             # Project summary and timeline
```

**Expected benefits:**
- **Clear progression:** Easy to see workflow from research to final delivery
- **Status clarity:** Immediately know if document is draft or final
- **Version control:** Drafts folder contains iterations; final folder has deliverables
- **Handoffs:** Each phase can be owned by different team members
- **Archival:** Old versions archived without cluttering active workspace

---

## 🔄 Alternative Approaches Considered

### Option 2: Flat with Rich Metadata (Score: 52/100)
**Why considered:**
- Dated file names already provide temporal organization
- File count (34) is still manageable
- Current partial structure is somewhat flat

**Why not recommended:**
- 34 files exceeds optimal range for flat structure (20-25 files)
- Difficult to distinguish drafts from final deliverables in flat list
- Project will continue to grow with future assessments
- Workflow clarity is lost - can't see "what phase are we in?"
- Stakeholder confusion about "which version is current?"

**When to reconsider:**
- If this were a one-time assessment with no future similar projects
- If file count stays <20
- If team strongly prefers simpler structure

### Option 3: Entity Clustering (Score: 28/100)
**Why not recommended:**
- Single entity focus (Sarah Johnson)
- No multiple companies or people to cluster by
- Access pattern is "What's the latest status?" not "Everything about entity X"
- Workflow progression is more important than entity grouping

**When to reconsider:**
- If assessing multiple candidates simultaneously
- If project expands to multiple executives

### Option 4: Artifact-Type Separation (Score: 18/100)
**Why not recommended:**
- All files are primarily documents (markdown, with few PDFs/DOCX)
- No scripts, data processing, or diverse artifact types
- Research and analysis project, not technical project

**When to reconsider:**
- If adding significant data analysis or automation

---

## 📋 Step-by-Step Migration Plan

### Phase 1: Preparation (10 minutes)

**1. Create backup:**
```bash
cd /home/sasha/all-project-files/deployed-md-files/docs/
cp -r exec-assessment-johnson/ exec-assessment-johnson-backup-2024-01-31
```

**2. Create phase directories:**
```bash
cd exec-assessment-johnson/
mkdir -p 1-research 2-data-collection 3-analysis 4-synthesis 5-drafts 6-final 7-archive source-materials
mkdir -p 7-archive/old-versions 7-archive/exploratory-notes
```

**3. Prepare project-overview.md:**
Create project summary document with timeline, team, objectives

---

### Phase 2: File Migration (30 minutes)

**Research Phase (5 files):**
```bash
mv project-brief.md 1-research/
mv assessment-framework-overview.md 1-research/assessment-framework.md
mv competency-model.md 1-research/
mv role-requirements-ceo.md 1-research/role-requirements.md
mv background-research-sarah.md 1-research/background-research.md
```

**Data Collection Phase (7 files):**
```bash
mv interview-prep.md 2-data-collection/interview-prep-questions.md
mv 2023-12-05-initial-interview.md 2-data-collection/2023-12-05-interview-sarah-initial.md
mv 2023-12-12-followup-interview.md 2-data-collection/2023-12-12-interview-sarah-followup.md
mv 2023-12-15-reference-john-smith.md 2-data-collection/2023-12-15-reference-call-john-smith.md
mv 2023-12-18-reference-jane-doe.md 2-data-collection/2023-12-18-reference-call-jane-doe.md
mv 2024-01-08-behavioral-observations.md 2-data-collection/
mv interview-summary.md 2-data-collection/interview-notes-summary.md
```

**Analysis Phase (7 files):**
```bash
mv competency-ratings.md 3-analysis/
mv leadership-analysis.md 3-analysis/leadership-style-analysis.md
mv strengths-profile.md 3-analysis/strengths-assessment.md
mv development-areas.md 3-analysis/
mv cultural-fit.md 3-analysis/cultural-fit-analysis.md
mv decision-making-eval.md 3-analysis/decision-making-evaluation.md
mv risk-assessment.md 3-analysis/risk-factors.md
```

**Synthesis Phase (5 files):**
```bash
mv key-findings.md 4-synthesis/
mv overall-eval.md 4-synthesis/overall-evaluation.md
mv role-fit.md 4-synthesis/fit-for-role-assessment.md
mv recommendations.md 4-synthesis/
mv development-plan-draft.md 4-synthesis/development-plan.md
```

**Drafts Phase (5 files):**
```bash
mv 2024-01-15-exec-summary-draft.md 5-drafts/2024-01-15-executive-summary-draft.md
mv 2024-01-18-report-v1.md 5-drafts/2024-01-18-full-report-draft-v1.md
mv 2024-01-22-report-v2.md 5-drafts/2024-01-22-full-report-draft-v2.md
mv 2024-01-25-recs-draft.md 5-drafts/2024-01-25-recommendations-section-draft.md
mv peer-review-notes.md 5-drafts/peer-review-feedback.md
```

**Final Deliverables Phase (4 files):**
```bash
mv 2024-01-30-executive-summary-FINAL.md 6-final/
mv 2024-01-30-full-report-FINAL.md 6-final/2024-01-30-full-assessment-report-FINAL.md
mv 2024-01-30-recommendations-FINAL.md 6-final/2024-01-30-recommendations-brief-FINAL.md
mv 2024-01-30-development-plan-FINAL.md 6-final/
```

**Archive (old versions from "Old Files/"):**
```bash
mv "Old Files/old-draft-v1.md" 7-archive/old-versions/
mv "Old Files/exploratory-notes.md" 7-archive/exploratory-notes/
# [Continue for remaining old files...]
```

**Source Materials:**
```bash
mv assessment-template.pdf source-materials/assessment-templates.pdf
mv competency-framework.pdf source-materials/
mv industry-benchmarks.docx source-materials/
```

**Remove empty/unclear directories:**
```bash
rmdir "Misc/" "Sarah's Stuff/" "Old Files/"
```

---

### Phase 3: Add Metadata (25 minutes)

**Add YAML frontmatter to each file:**

**Research phase files:**
```yaml
---
phase: research
created: 2023-12-01
updated: 2023-12-05
type: planning-document
status: complete
project: exec-assessment-johnson
candidate: sarah-johnson
tags: [assessment-framework, planning]
---
```

**Data collection phase files:**
```yaml
---
phase: data-collection
created: 2023-12-05
type: interview-transcript
status: complete
project: exec-assessment-johnson
candidate: sarah-johnson
interviewee: sarah-johnson
interviewer: assessment-team
tags: [interview, primary-research, behavioral-assessment]
---
```

**Analysis phase files:**
```yaml
---
phase: analysis
created: 2024-01-10
updated: 2024-01-15
type: competency-analysis
status: complete
project: exec-assessment-johnson
candidate: sarah-johnson
tags: [competency-assessment, leadership-analysis, strengths]
---
```

**Synthesis phase files:**
```yaml
---
phase: synthesis
created: 2024-01-16
updated: 2024-01-20
type: synthesis-document
status: complete
project: exec-assessment-johnson
candidate: sarah-johnson
tags: [synthesis, recommendations, overall-assessment]
---
```

**Draft phase files:**
```yaml
---
phase: drafts
created: 2024-01-18
updated: 2024-01-22
version: v2
type: draft-report
status: draft
project: exec-assessment-johnson
candidate: sarah-johnson
tags: [draft, work-in-progress, full-report]
---
```

**Final deliverables files:**
```yaml
---
phase: final
created: 2024-01-30
version: FINAL
type: deliverable
status: delivered
project: exec-assessment-johnson
candidate: sarah-johnson
delivery-date: 2024-01-30
tags: [final-deliverable, executive-summary, client-facing]
---
```

---

### Phase 4: Create Project Overview (15 minutes)

**Create `project-overview.md` with project summary:**

```markdown
# Executive Assessment: Sarah Johnson

**Candidate:** Sarah Johnson
**Position:** Chief Executive Officer (CEO)
**Client:** [Client Organization Name]
**Assessment Period:** December 2023 - January 2024
**Assessment Team:** Lead Assessor, Interview Team, Research Analyst
**Status:** Completed and Delivered

---

## Project Timeline

| Phase | Dates | Status |
|-------|-------|--------|
| Research & Planning | Dec 1-4, 2023 | ✅ Complete |
| Data Collection | Dec 5-Jan 8, 2024 | ✅ Complete |
| Analysis | Jan 9-15, 2024 | ✅ Complete |
| Synthesis | Jan 16-20, 2024 | ✅ Complete |
| Drafting | Jan 18-25, 2024 | ✅ Complete |
| Final Delivery | Jan 30, 2024 | ✅ Delivered |

---

## Project Objectives

1. Assess Sarah Johnson's leadership capabilities and executive potential
2. Evaluate fit for CEO role at [Client Organization]
3. Identify strengths, development areas, and potential risks
4. Provide actionable recommendations for hiring decision and onboarding
5. Develop leadership development plan if hired

---

## Assessment Scope

**Competencies Evaluated:**
- Strategic thinking and vision
- Decision-making and judgment
- Leadership style and executive presence
- Team building and talent development
- Change management and adaptability
- Financial acumen and business judgment
- Stakeholder management and communication

**Data Sources:**
- Background research and resume review
- Two in-depth behavioral interviews (4+ hours total)
- Three reference calls with former colleagues
- Behavioral observations during candidate presentation
- Assessment against custom competency framework

---

## Key Deliverables

Located in `6-final/`:
1. **Executive Summary** - 2-page overview for board review
2. **Full Assessment Report** - Comprehensive 15-page analysis
3. **Recommendations Brief** - Hiring recommendation and rationale
4. **Development Plan** - 90-day onboarding and development roadmap

---

## Navigation Guide

**By Phase:**
- `1-research/` - Initial planning and framework development
- `2-data-collection/` - Interviews and primary research
- `3-analysis/` - Competency evaluations and assessments
- `4-synthesis/` - Integrated findings and insights
- `5-drafts/` - Report development and iterations
- `6-final/` - Completed deliverables (START HERE for final reports)
- `7-archive/` - Historical versions and exploratory work

**Quick Access:**
- **Latest deliverables:** See `6-final/` folder
- **Interview transcripts:** See `2-data-collection/`
- **Competency ratings:** See `3-analysis/competency-ratings.md`
- **Final recommendations:** See `6-final/2024-01-30-recommendations-brief-FINAL.md`

---

## Citations

See `citations.md` for all sources and references used in assessment.

---

**Maintained by:** Assessment Team
**Last Updated:** 2024-01-30
```

---

### Phase 5: Verification (10 minutes)

**Verification checklist:**

- [ ] All 34 files migrated to appropriate phase folders
- [ ] No files remaining at unclear locations (`Misc/`, `Sarah's Stuff/` removed)
- [ ] Phase folders follow numbered sequence (1- through 7-)
- [ ] YAML frontmatter added to all files with consistent phase tags
- [ ] `project-overview.md` created with navigation guidance
- [ ] `citations.md` updated with new file paths if needed
- [ ] Final deliverables clearly marked "FINAL" in both filename and metadata
- [ ] Drafts and final versions distinguished (drafts in `5-drafts/`, finals in `6-final/`)
- [ ] Old versions moved to `7-archive/old-versions/`
- [ ] Source materials organized in dedicated folder

**Testing navigation:**
```bash
# Verify phase structure
ls -l exec-assessment-johnson/

# Count files per phase
find exec-assessment-johnson/1-research/ -type f | wc -l
find exec-assessment-johnson/6-final/ -type f | wc -l

# Verify final deliverables
ls -la exec-assessment-johnson/6-final/
```

**Stakeholder communication:**
- Notify team: "Final deliverables are in `6-final/` folder"
- Archive announcement: "Old versions moved to `7-archive/`"
- Navigation guide: Point team to `project-overview.md` for orientation

---

**Estimated total time:** 90 minutes (1 hour 30 minutes)

---

## 📖 Tagging Strategy

### Primary Tags (Required)

**Phase tags:**
- `phase: research`
- `phase: data-collection`
- `phase: analysis`
- `phase: synthesis`
- `phase: drafts`
- `phase: final`
- `phase: archive`

**Status tags:**
- `status: complete` - Phase work finished
- `status: draft` - Work in progress
- `status: delivered` - Final deliverable sent to client
- `status: superseded` - Replaced by newer version

**Type tags:**
- `type: planning-document`
- `type: interview-transcript`
- `type: competency-analysis`
- `type: synthesis-document`
- `type: draft-report`
- `type: deliverable`

### Secondary Tags (Optional but Recommended)

**Content focus tags:**
- `focus: leadership`
- `focus: competencies`
- `focus: behavioral-assessment`
- `focus: references`
- `focus: recommendations`
- `focus: development-plan`

**Methodology tags:**
- `methodology: primary-research`
- `methodology: interview`
- `methodology: reference-call`
- `methodology: behavioral-observation`
- `methodology: competency-framework`

### Tag Usage Examples

**Interview transcript:**
```yaml
---
phase: data-collection
created: 2023-12-05
type: interview-transcript
status: complete
interviewee: sarah-johnson
interviewer: lead-assessor
focus: [leadership, strategic-thinking, decision-making]
methodology: interview
tags: [primary-research, behavioral-assessment]
---
```

**Final deliverable:**
```yaml
---
phase: final
created: 2024-01-30
version: FINAL
type: deliverable
status: delivered
delivery-date: 2024-01-30
focus: [executive-summary, recommendations]
tags: [final-deliverable, client-facing, board-review]
---
```

---

## ✅ Expected Benefits

### After Reorganization

**Workflow clarity:**
1. **Phase visibility:** Team can see "We're in synthesis phase" at a glance
2. **Status certainty:** Clear distinction between drafts and final deliverables
3. **Progress tracking:** Numbered phases show project progression
4. **Handoffs:** Each phase can be "closed out" and handed to next team member

**Stakeholder benefits:**
1. **Quick access to finals:** Navigate directly to `6-final/` for deliverables
2. **No version confusion:** Latest is in `6-final/`, older versions in `5-drafts/` or `7-archive/`
3. **Transparency:** Project overview shows timeline and current status
4. **Confidence:** Clear structure demonstrates professionalism and thoroughness

**Project reusability:**
1. **Template creation:** This structure becomes template for future executive assessments
2. **Process documentation:** Phase structure documents actual workflow
3. **Quality control:** Easy to verify all phases completed before finalizing
4. **Training:** New team members can follow phase sequence to understand methodology

---

## 🔄 Maintenance Guidelines

### During Active Project

**Daily/weekly:**
- Save work to appropriate phase folder as you create it
- Update `status` in YAML frontmatter as work progresses
- Move completed drafts from `5-drafts/` to `6-final/` when finalized
- Update `project-overview.md` timeline as phases complete

**Phase transitions:**
- Before moving to next phase, verify previous phase is complete
- Create summary document at end of each phase (e.g., `interview-notes-summary.md` at end of data collection)
- Update project-overview.md with phase completion date

### After Project Completion

**Archive and close:**
- Verify all final deliverables in `6-final/` folder
- Move all superseded versions to `7-archive/old-versions/`
- Update project-overview.md with final status and delivery date
- Create project-lessons-learned.md if valuable insights emerged

**Future similar projects:**
- Use this structure as template
- Copy phase folder structure (empty folders)
- Copy `project-overview.md` template with placeholder content
- Reuse `1-research/` framework documents

### When to Reorganize Again

**Unlikely to need reorganization** - Phase-based structure is stable for project lifecycle

**Possible adjustments:**
- Add sub-phases if any phase grows >15 files (e.g., `2-data-collection/interviews/` and `2-data-collection/observations/`)
- Add new phases if workflow changes (e.g., add `8-follow-up/` for post-delivery questions)

---

## 🆘 Rollback Plan

### If Reorganization Doesn't Work

**Scenario 1: Team finds phases too rigid**
1. Restore from backup: `cp -r exec-assessment-johnson-backup-2024-01-31/* exec-assessment-johnson/`
2. Try hybrid: Keep only `drafts/` and `final/` folders, rest flat with dates
3. Document feedback in this analysis

**Scenario 2: Phases don't match actual workflow**
1. Identify which phases don't work
2. Rename/restructure phases to match team's actual process
3. Keep numbering system but adjust phase names

**Scenario 3: Too much moving between folders**
1. Consider fewer, broader phases (e.g., combine analysis + synthesis into `3-evaluation/`)
2. Keep drafts/finals separation but simplify early phases

---

## 📈 Success Metrics

### 1 Week Post-Migration

**Measure:**
- Team can find latest deliverable without asking (target: 100%)
- No confusion about draft vs. final status (target: 0 questions)
- Phase folders used correctly for new files (target: >90%)
- Stakeholder satisfaction with organization (target: positive feedback)

### Project Completion

**Evaluate:**
- Was progression through phases clear and logical?
- Did structure help or hinder workflow?
- Would team use this structure again for similar projects?
- Did clients/stakeholders easily navigate to final deliverables?

---

**Generated by:** Sasha - Folder Organization Analyzer Skill v1.0
**Need help?** Rerun skill or consult [SKILL.md](../../SKILL.md)
**For scoring details:** See [scoring-rubric.md](../scoring-rubric.md)

---

*This example demonstrates how Phase-Based Hierarchy transforms an executive assessment from scattered files into a clear progression from research to delivery.*
