# Writing voice

A default writing skill for clear, natural, evidence-grounded prose in English
and Italian. Covers answers, explanations, emails, comments, reports, theses,
papers, documentation, translation, summaries, and creative writing.

Combines contextual anti-slop checks, voice calibration, scholarly safeguards,
and claim-evidence/claim-feasibility discipline. The operational skill is fully
contained in writing-voice/SKILL.md. See SOURCE-MAPPING.md for provenance and
explicit adaptations of blader/humanizer, academic-humanizer, and Cursor unslop.
This is not an AI detector or a guarantee of undetectability.

## Install locally

Requires git, Python 3, and a POSIX shell for these commands. Windows users can
use a suitable shell environment or copy the folder manually.

    git clone https://github.com/ppfp-03/writing-voice.git
    cd writing-voice
    sh scripts/install.sh claude

To also install the identical skill for a Codex worker:

    sh scripts/install.sh codex

The installer copies the skill to ~/.claude/skills/writing-voice or
~/.codex/skills/writing-voice. These are conventional local CLI locations, not
universal T3 configuration guarantees. Set WRITING_VOICE_SKILLS_DIR if your
worker uses a different skills directory. Existing installations are not
overwritten unless FORCE=1 is explicitly supplied.

## Persistent instructions and T3 orchestration

Installation does not force selection. Read docs/T3-SETUP.md. Add the instruction
snippet from templates/WRITING-POLICY.md to the actual instructions loaded by your
orchestrator and workers. The installer does not modify CLAUDE.md, AGENTS.md, the
Thesis project, global agent instructions, or any external repository.

## Examples

    Apply writing-voice. Light edit this thesis section. Preserve meaning,
    structure, data, and citations. Return the final text only.

    Apply writing-voice. Audit this introduction for claim-evidence alignment.
    Distinguish unavailable sources from verified support.

    Apply writing-voice. Draft an Italian email from these points. Do not
    invent availability, attachments, or prior agreements.

## Package for a ZIP-based skill uploader

    python3 scripts/package.py

This creates dist/writing-voice.zip with writing-voice/SKILL.md inside. The
archive is generated locally; it is not committed or published as a release.
For local CLI agents use the installation steps above instead.

## Update and reproducibility

Review updates before installation. Record the repository commit used in a
research project; use a detached checkout of that commit for repeatable installs.
The installed copy does not automatically update on git pull. Rerun installation
with FORCE=1 only after reviewing changes.

## Limits

Instructions are not deterministic enforcement. Confirm worker file access and
actual invocation in your environment. This version has a manual coverage map,
not an empirical writing-quality benchmark or calibration on the author's samples.
All academic output needs author review. Funding templates are not official
current funder guidance. Source attribution does not grant licenses to upstream
material; see SOURCE-MAPPING.md.
