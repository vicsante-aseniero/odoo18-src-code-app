# Odoo 18 Community — Developer Workspace

Overview
- This repository contains the Odoo 18 Community source used for local development and testing.
- Odoo source is located at `./odoo` (branch `18`, upstream: https://github.com/odoo/odoo.git).
- Third-party educational ERP `openeducat_erp` is included under `./extra-addons/openeducat_erp` as a git submodule (https://github.com/openeducat/openeducat_erp, https://openeducat.org).
- Odoo developer tutorials are available in `./tutorials` (see https://www.odoo.com/documentation/18.0/developer/tutorials/setup_guide.html).

Quick start
- Ensure Docker (or devcontainer) + Postgres container (example name `postgres-dev`) are running.

- Import DB setup SQL into `postgres-dev` (example):
```
docker cp ./.devcontainer/odoo/setup.sql postgres-dev:/tmp/odoo-setup.sql
docker exec -it postgres-dev psql -U postgres -d postgres -f /tmp/odoo-setup.sql
```

- Check Postgres readiness:
```
pg_isready -d odoo18 -h postgres-dev -p 5432 -U odoo_user
```

- Initial Odoo run (development):
```
./odoo-bin -i all --addons-path=./odoo/addons/,./extra-addons/openeducat/,./tutorials/   --database=odoo18dev --db_user=odoo_user --db_password=jajnav5@ --dev=all
```

- Update modules after changes:
```
./odoo-bin -u all --addons-path=./odoo/addons,./extra-addons/openeducat/,./tutorials/   --database=odoo18dev --db_user=odoo_user --db_password=jajnav5@ --dev=all
```

- Run using config file:
```
./odoo-bin -u all -c ./config/odoo-cmd.conf --dev=all
```

Git submodules
- Initialize or update submodules:
```
git submodule update --init --recursive
git submodule update --remote --merge
```
- `openeducat_erp` is expected as a submodule under `./extra-addons`.

Project layout
- `./odoo` — Odoo 18 Community source
- `./extra-addons/openeducat_erp` — OpenEduCat submodule
- `./tutorials` — Odoo tutorial modules and examples
- `.devcontainer/odoo` — devcontainer scripts and DB initialization
- `.ai-prompts-prds/prompts` — AI prompt templates and documentation

Development notes & suggestions
- Use `.devcontainer/odoo/instruction.txt` for DB setup and first run.
- Consider adding a `Makefile` or scripts for common tasks (`dev`, `db-reset`, `update-submodules`, `run-tests`).
- Add CI to run linting and basic module checks on PRs.
- Avoid committing sensitive credentials; prefer environment variables.

Contributing
- Update submodules with `git submodule update --remote` and open PRs from feature branches.
- Run `./odoo-bin -u <module>` to test changes locally.

License
- This repository contains Odoo Community Edition and third-party modules. Check licenses of each component before reuse (see `./odoo/LICENSE` and submodule license files).

For future documentation
- See `.ai-prompts-prds/prompts/PROMPT-READ.md` and `.ai-prompts-prds/prompts/PROMPT-ANALYSIS.md` for templates to add future README/ANALYSIS updates.
