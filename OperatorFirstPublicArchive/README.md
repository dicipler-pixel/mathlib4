# Operator-First Certified Lean Public Archive

Author: Jeromie N. Beasley

This branch is the public source archive for machine-checked Lean mathematics recovered from the private `dicipler-pixel/operator-first` research repository.

## Publication rule

- Each archived source is copied verbatim from the exact certified source commit listed below.
- Certification applies only to the exact Lean theorem statements and explicit hypotheses.
- A Lean certificate does not automatically certify surrounding physical interpretation, empirical claims, continuum limits, or global conjectures.
- The archive is intentionally separate from mathlib contribution branches. Reusable results are extracted into small mathlib PRs one at a time.
- Active competition strategy, target queues, private move sequences, and operational ACC data are not part of this mathematical archive.

## Published certified tranche

| Tag | Source | Verified head | Evidence run | Public path |
| --- | --- | --- | --- | --- |
| LC-001 | OperatorFirst Core Kernel | `9bbc220aabf9d0b2afbfd2630a84cb971b7b7390` | `33974837543` | `OperatorFirstPublicArchive/LC-001/OperatorFirst.lean` |
| LC-002 | Offset Core | `92a95a427ddf4e9a8c3216aab4af2a65730a050f` | `33976842609` | `OperatorFirstPublicArchive/LC-002/Offset.lean` |
| LC-002 | Offset Fock Core | `92a95a427ddf4e9a8c3216aab4af2a65730a050f` | `33976842609` | `OperatorFirstPublicArchive/LC-002/OffsetFock.lean` |
| LC-006 | Laurent Boundary Mechanism | `c6cdbeea35acd0c1ddd0f6d4d98d58ef38215daa` | `34041125969` | `OperatorFirstPublicArchive/LC-006/LaurentBoundary.lean` |
| LC-008 | Gravity Projector Algebra | `2ded71b0e7a73e4df994faff2694beacbf8ffff4` | `34035655097` | `OperatorFirstPublicArchive/LC-008/Gravity.lean` |
| LC-009 | Projector Overlap C1 Bridge | `63c11a656ea78097d1cd61a0994cb9baa0e3bc8e` | `34130027417` | `OperatorFirstPublicArchive/LC-009/GravityOverlap.lean` |

## Current mathlib extraction work

- PR #43703 — rank-two Coxeter group identified with a dihedral group.
- PR #43951 — trace identity for idempotent matrix differences.
- `feat/laurent-degree-add-mul` — Laurent-polynomial degree API extraction from LC-006, pending verification/PR promotion.

## Recovery sources

The broader inventory is being reconstructed from:
1. the private repository's exact certified heads and CI records;
2. the Drive certificate set (`LEAN CERTIFICATE 001` onward);
3. the master Lean certificate registry;
4. recovered formal branches and title-kernel audits.

The next tranches will add the remaining green certificates before audited drafts are considered.
