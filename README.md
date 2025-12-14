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
=======
# Odoo 18 Community Source Code
Odoo18 ERP Opensource
=====================
[![Build Status](https://runbot.odoo.com/runbot/badge/flat/1/master.svg)](https://runbot.odoo.com/runbot)
[![Tech Doc](https://img.shields.io/badge/master-docs-875A7B.svg?style=flat&colorA=8F8F8F)](https://www.odoo.com/documentation/master)
[![Help](https://img.shields.io/badge/master-help-875A7B.svg?style=flat&colorA=8F8F8F)](https://www.odoo.com/forum/help-1)
[![Nightly Builds](https://img.shields.io/badge/master-nightly-875A7B.svg?style=flat&colorA=8F8F8F)](https://nightly.odoo.com/)

Odoo
====
Odoo is a suite of web based open source business apps.

The main Odoo Apps include an <a href="https://www.odoo.com/page/crm">Open Source CRM</a>,
<a href="https://www.odoo.com/app/website">Website Builder</a>,
<a href="https://www.odoo.com/app/ecommerce">eCommerce</a>,
<a href="https://www.odoo.com/app/inventory">Warehouse Management</a>,
<a href="https://www.odoo.com/app/project">Project Management</a>,
<a href="https://www.odoo.com/app/accounting">Billing &amp; Accounting</a>,
<a href="https://www.odoo.com/app/point-of-sale-shop">Point of Sale</a>,
<a href="https://www.odoo.com/app/employees">Human Resources</a>,
<a href="https://www.odoo.com/app/social-marketing">Marketing</a>,
<a href="https://www.odoo.com/app/manufacturing">Manufacturing</a>,
<a href="https://www.odoo.com/">...</a>

Odoo Apps can be used as stand-alone applications, but they also integrate seamlessly so you get
a full-featured <a href="https://www.odoo.com">Open Source ERP</a> when you install several Apps.

Getting started with Odoo
=========================

For a standard installation please follow the <a href="https://www.odoo.com/documentation/master/administration/install/install.html">Setup instructions</a>
from the documentation.

To learn the software, we recommend the <a href="https://www.odoo.com/slides">Odoo eLearning</a>, or <a href="https://www.odoo.com/page/scale-up-business-game">Scale-up</a>, the <a href="https://www.odoo.com/page/scale-up-business-game">business game</a>. Developers can start with <a href="https://www.odoo.com/documentation/master/developer/howtos.html">the developer tutorials</a>