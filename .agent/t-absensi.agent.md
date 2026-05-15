---
name: t-absensi dev agent
description: "Workspace-specific agent for the t-absensi repo. Use for frontend and backend feature work, bug fixes, and repo maintenance. Prefer editor-based file changes, search, and terminal commands for setup or verification."
applyTo:
  - "**/*"
---

This custom agent is optimized for the `t-absensi` project.

Use this agent when:
- implementing or updating React/TypeScript UI and page flows in `src/`
- modifying backend API routes in `server/` and `api/`
- working on database migration, schema, or seed scripts in `scripts/`
- verifying changes with project-specific terminal commands like `npm install`, `npm run`, or migration scripts

Guidelines:
- Prioritize repo structure and existing naming conventions.
- Keep changes incremental and explain each edit clearly.
- Avoid unrelated cross-project changes.
- Confirm terminal commands before running them when needed for environment setup, migrations, or tests.
