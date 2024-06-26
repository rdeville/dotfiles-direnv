<!-- markdownlint-disable-file -->
# CHANGELOG

## v1.2.0 (2024-06-26)

### ✨ Minor

  * ✨ Update nixification with nix packaging by Romain Deville ([`db43805`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/db438059ebdfb565c2cfbde5e566f872f3e352c0)) 🔏
  * ✨ Add use_nix_flake to direnv stdlib by Romain Deville ([`470f7fd`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/470f7fd284decdb64c9f7e82c9f0e35a90e58f5e)) 🔏
  * ✨ Add nixification of the repo with flake and devenv by Romain Deville ([`32473ea`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/32473eac9a4593ac305c67f84fc27c821120b90d)) 🔏
  * ✨ Improve direnvrc with logging by Romain Deville ([`8cc8ad5`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/8cc8ad52176001d06e75cfb1ff5dea13c01a8ac7)) 🔏
  * ✨ Add new function in stdlib and normalize all by Romain Deville ([`0af9ed6`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/0af9ed69448535a13ef3a6c698f4c270d926eb47)) 🔏
  * ✨ add use of devenv in lib by Romain Deville ([`e9e21c1`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/e9e21c1ab7056f658fe52a0b0f9d4fd456f0316e)) 🔏
  * ✨ Update new envrc templates by Romain Deville ([`3a2bcc7`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/3a2bcc7acdd8a690e764bcd94c16dcd5546279aa)) 🔏
  * ✨ Add new lib method instead of modules by Romain Deville ([`69c71b2`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/69c71b27c3ccd697dd56c591b8dac04d4a9402e9)) 🔏
  * ✨ Upgrade bootstrap to setup.sh by Romain Deville ([`884f0dc`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/884f0dcdb6b6d57065e95447a19388cd7c0fea31)) 🔏
  * ✨ Update log script management by Romain Deville ([`e5f9e48`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/e5f9e489e7d08fa854fa364e07678feaf479d679)) 🔏
  * ✨ Add bootstrap script to symlink in ~/.config by Romain Deville ([`76688bc`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/76688bc258bf384601ab2b07ddc4fcb6b4dcb890)) 🔏
  * ✨ Big rework of the modules by Romain Deville ([`1fab9fa`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/1fab9fa5b66effcfcb5dc78ac66ce4c1790204b5)) 🔏

### 🩹 Patch

  * ⚡️ Add timeout to _init_logger by Romain Deville ([`e8faaa9`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/e8faaa94636bd1e39fc15c2d92e2c359409496ae)) 🔏
  * ⚡️ Improve direnv management, auto load tmux by Romain Deville ([`10c8837`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/10c88375d845ac48aba484f6258df3833ec83668)) 🔏
  * ✏️ Fix typo in end of direnv.toml by Romain Deville ([`b2a5979`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/b2a5979be214c308d7e4c741161145970f4813cc)) 🔏
  * ✏️ Fix variable name in setup.sh by Romain Deville ([`069a672`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/069a6724b92a25cf33ae55d08580279041ecc325)) 🔏
  * ✏️ Fix typoe in envrc.template by Romain Deville ([`67e8663`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/67e8663a13a499c7608b69cc5f67cfcef2ddf6c4)) 🔏
  * ✏️ Fix typo in template by Romain Deville ([`f4dd807`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/f4dd807ec523224f9403670ceaeac6e945b5ad7b)) 🔏
  * ✏️ Fix typo to prevent globbing by Romain Deville ([`5216796`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/5216796d6c422fbac09ca636a5e9ae419c52fe48)) 🔏
  * 🍱 Update templates examples by Romain Deville ([`ae8c5ef`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/ae8c5ef7b185838273224052b2c13337bff7eaab)) 🔏
  * 🐛 Fix bug in direnvrc when using cmd: as value by Romain Deville ([`79e1c07`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/79e1c07a3b036e643d95e48d1dc054b6729617eb)) 🔏
  * 🐛 Fix bug in cmd: execution by Romain Deville ([`2ccc3f4`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/2ccc3f4c76ba1886c5aefe0b3e7d97edcd165756)) 🔏
  * 🐛 Fix symlink issues by Romain Deville ([`0427cce`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/0427ccea8d3fd4682894307903ea8ff4263a7d10)) 🔏
  * 🐛 Fix bug in direnv_log by Romain Deville ([`c5d2fed`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/c5d2fed84a59c223e33328a9f3f72d8a9ed30cac)) 🔏
  * 🔧 Add Python Semantic Release configuration by Romain Deville ([`77a3e76`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/77a3e7654767bcfcba9b6b49f0b968f8f4d751cd)) 🔏
  * 🔧 Update editorconfig from DGS by Romain Deville ([`7ba4b28`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/7ba4b28d89b5a509999a342a04a42b1600156ab7)) 🔏
  * 🔧 Add cspell configuration by Romain Deville ([`91d1fa8`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/91d1fa873f7c7bc2e52797b0c5f8b987e93074fa)) 🔏
  * 🔧 Add commitlint configuration by Romain Deville ([`20fea56`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/20fea56a1f191ff9b51196082c224789b3d26880)) 🔏
  * 🔧 Add markdownling config and ignore by Romain Deville ([`252aa3c`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/252aa3c5f1da3578beb5b971b0b22d7d08c75565)) 🔏
  * 🔧 Add pre-commit configuration by Romain Deville ([`cc5ea93`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/cc5ea9335795c5cbb84eae6258ee33822d9f6ed4)) 🔏
  * 🔧 Add .dotgit.yaml to use DGS by Romain Deville ([`c8c74f5`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/c8c74f548b8e77041c46f7dd7d4388d5178d6383)) 🔏
  * 🔧 Update comment in direnv.toml by Romain Deville ([`1335f99`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/1335f99a8b355149e154641c0480134fc06cff5b)) 🔏
  * 🔧 update init script devbox by Romain Deville ([`ac63319`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/ac63319e502c41a8bf95a5c5ee40be880ac61d0a)) 🔏
  * 🔧 update direnvrc by Romain Deville ([`5d31de3`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/5d31de3520b7fe157bbc94f89e9479d694cf1b62)) 🔏
  * 🔧 update templates by Romain Deville ([`73086d2`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/73086d2aa2c51b529adc8ed0e7d77a60ab47718f)) 🔏
  * 🔧 Update sha1 by Romain Deville ([`d5719f8`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/d5719f8a3e84823067164b496cb76295939374bd)) 🔏
  * 🔧 Update sha1 of tmuxp template default by Romain Deville ([`e53fe86`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/e53fe86fdc56d0cdb4e09fb099886cf2ddb68492)) 🔏
  * 🔧 Update default tmuxp template by Romain Deville ([`9055f2a`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/9055f2a23553ec13a0d6dfc0bab9e1a214b5eba8)) 🔏
  * 🔧 Compute SHA1 of new file version by Romain Deville ([`20d7db7`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/20d7db7f3f75a77c3e5f9adff451588904523be6)) 🔏
  * 🔧 Update behaviour of tmuxp by Romain Deville ([`834528c`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/834528cbf8b597f6f119851c110ad2f280ef6f28)) 🔏
  * 🔧 Update SHA1 by Romain Deville ([`d1c537a`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/d1c537af11878e88fa33e57570e05ad23e71a2c2)) 🔏

### 🔊 Others

  * ♻️ Refacto my own direnv stdlib by Romain Deville ([`d39ffab`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/d39ffabd320769a6febdf8eab9c17c2f09dd1f7b)) 🔏
  * ♻️ refactor lib functions by Romain Deville ([`b2af854`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/b2af85412d0e00e7ed51b55dda41a331edb27b5e)) 🔏
  * ♻️  Huge refactorisation of the code by Romain Deville ([`c42e44a`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/c42e44aecc5aeb7a4b35e6fea334bbe5ef22f845)) 🔏
  * 🎨 Fix python module, add custom cmd and update sha1 by Romain Deville ([`9caffb8`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/9caffb804a08dd0f0339246ce46b34126f13b829)) 🔏
  * 👷 Add Gitlab CI build from DGS by Romain Deville ([`ebf2aa4`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/ebf2aa48a81fc7ccb7051409924fe771e759f99c)) 🔏
  * 📄 Update licenses from DGS by Romain Deville ([`1c25712`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/1c25712d4b9addbb97a6322a3a03cf49eb47473a)) 🔏
  * 📝 Update README.md from DGS by Romain Deville ([`45e0bae`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/45e0bae97aa8146d1d3eba149b11b602ae704fe1)) 🔏
  * 📝 Add CODE_OF_CONDUCT from DGS by Romain Deville ([`b0a1a40`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/b0a1a404db07f817c8d0d4508da33bb849e2c4eb)) 🔏
  * 📝 Update README by Romain Deville ([`e032615`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/e03261528c3c9715315a42dad6c4a537302b1d51)) 🔏
  * 🔇 Replace echo with direnv_log by Romain Deville ([`52f2367`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/52f2367059f81ea0edebd0c0f11ff0e62e7d1b70)) 🔏
  * 🔇 Allow to decrease direnv verbosity by Romain Deville ([`a97c679`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/a97c67911ab78d87579c6d7b05c09ad47f777e47)) 🔏
  * 🔊 Update default debug level variable by Romain Deville ([`68aff33`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/68aff333c47dbb4fdd7d7f0aab2be01db124b187)) 🔏
  * 🔥 Remove logos by Romain Deville ([`b9c9a60`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/b9c9a60122cef9b35905fff3597da8304fd82344)) 🔏
  * 🔥 remove devbox related files by Romain Deville ([`86fb665`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/86fb66536ceb0215d2f9bb1025ab089550e2bbbd)) 🔏
  * 🔥 Huge clean of all the repos by Romain Deville ([`20c92e1`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/20c92e115ba29ebb15f4d8bf77d5be4ae9ff5cd1)) 🔏
  * 🔥 Remove most of now useless direnvrc by Romain Deville ([`ff675c5`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/ff675c56220f38306b5760d30a3c5a1e5a5672b0)) 🔏
  * 🔥 Remove now useless direnv.sha1 by Romain Deville ([`8c9fe36`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/8c9fe36ee21764527d32fa5c9c0aa177e0c67b4a)) 🔏
  * 🔥 Remove src folder by Romain Deville ([`2ed17c1`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/2ed17c11b78e35ed046931249a30ded4251666f8)) 🔏
  * 🔥 Remove modules by Romain Deville ([`2ef31f6`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/2ef31f635057d5fb67fe5e3891e40cc631fb9502)) 🔏
  * 🔥 Remove deprecated modules by Romain Deville ([`967006e`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/967006e46408063e2b725c6626afadce7ab5621a)) 🔏
  * 🔥 Remove modules with their documentation by Romain Deville ([`d219a20`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/d219a20a797f870a3273ae463ecf0781426eaecf)) 🔏
  * 🔨 Add devbox configuration by Romain Deville ([`3e239f5`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/3e239f58fef367d49d56557889b2c09ef0f051bc)) 🔏
  * 🔨 Update .envrc from direnv template by Romain Deville ([`4d26348`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/4d26348f44f32acd5792cee983f157f76743281b)) 🔏
  * 🔨 Update .envrc using now nixified repos by Romain Deville ([`6f8dc4e`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/6f8dc4e4920bbc615ff9a1c1cae224734452fb85)) 🔏
  * 🔨 Update templates scripts by Romain Deville ([`f172f12`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/f172f12d2530ff51341ecd9110942c0081b3309a)) 🔏
  * 🔨 Update setup script by Romain Deville ([`5759498`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/5759498cd2b5139b079bec45d97e647179a76d38)) 🔏
  * 🔨 Add direnv and devbox.json configuration by Romain Deville ([`9a205c3`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/9a205c325a3d1bf8c356e5d00eaae8c8a67e33ca)) 🔏
  * 🔨 Update tools script by Romain Deville ([`dd05a8d`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/dd05a8d13bd1bcc2e9f181c7ca07a3a9c3419602)) 🔏
  * 🙈 Update gitignore by Romain Deville ([`b588f72`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/b588f7245672585ef46cfe3e0fc755083c0c0574)) 🔏
  * 🙈 Update gitignore from DGS by Romain Deville ([`2ffb86a`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/2ffb86a3caf8cb460c681bcf7c8c79b40c8eb6a1)) 🔏
  * 🙈 Make lib folder an exception in gitignore by Romain Deville ([`a273704`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/a27370481c327ac53549245648c7cfaca0887573)) 🔏
  * 🙈 Add .devenv to gitignore by Romain Deville ([`c7a0b88`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/c7a0b88f28742fcee8ca0f75a3b3217eeeb9372a)) 🔏
  * 🙈 Update gitignore by Romain Deville ([`cb2af19`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/cb2af19683a7eba12f9bd7560a82433b602071ba)) 🔏
  * 🚨 Fix linter warning by Romain Deville ([`c87a46f`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/c87a46f8b53d545053f2e7b2c55ba62445309bfb)) 🔏

## v1.1.3 (2022-01-15)

### 🩹 Patch

  * 🐛 Fix keepass bug when sourcing up leading to loop by Romain Deville ([`46f71fe`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/46f71fe79dae07cb63866082a2c8886485512c91)) 🔏

### 🔊 Others

  * 🔖📝 Write v1.1.3 release note by Romain Deville ([`e8e147d`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/e8e147dfbe81d721eb2fa49ba70a7b567fcc4c2d)) 🔏
  * 🔀 release-1.1.3 into master by Romain Deville ([`e52f656`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/e52f656c2d5fc7f70eadde7d71725f7d3884de87)) 🔏
  * 🔀 🔖v1.1.2 into develop by Romain Deville ([`b49421a`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/b49421a09eb5ef78503f5df2f233347d9c06693f)) 🔏

## v1.1.2 (2022-01-13)

### 🩹 Patch

  * 🔧 Recompute sha1 files by Romain Deville ([`82be82b`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/82be82b9a6db3de251545a91a20480efbe400e90)) 🔏

### 🔊 Others

  * 📝🔖 Write release note of v1.1.2 by Romain Deville ([`16c498c`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/16c498c53c799d2e3f8080dfde9d6d153f74040b)) 🔏
  * 🔀 hotfix-1.1.2 into master by Romain Deville ([`ce78ed7`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/ce78ed798a1c28428b6b5d6c024bb6c275b65932)) 🔏
  * 🔀 🔖v1.1.1 into develop by Romain Deville ([`7b521af`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/7b521afe49f3bb47508edc23fe4f496d235afbf2)) 🔏

## v1.1.1 (2022-01-13)

### 🔊 Others

  * 📝🔖 Write v1.1.1 release note by Romain Deville ([`06f8b74`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/06f8b740f7541a10600e4cc6c867322f7255759b)) 🔏
  * 📝 Fix wrong link in README.md by Romain Deville ([`9bdb9b3`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/9bdb9b3eb6023041faf982e8cb57f1afaa974ee7)) 🔏
  * 🔀 hotfix-1.1.1 into master by Romain Deville ([`1e29077`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/1e29077efd48871e76b83892037a9ef61f67aff0)) 🔏
  * 🔀 🔖v1.1.0 into develop by Romain Deville ([`fc34f1d`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/fc34f1df1070652322c7d15116b02f4cf3d2e78e)) 🔏

## v1.1.0 (2022-01-13)

### ✨ Minor

  * ✨ Add new tmuxp_config module &amp; minor fix scripts by Romain Deville ([`10a7fbc`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/10a7fbcb99fff2f4929341c9039b75fbb2fd1136)) 🔏

### 🔊 Others

  * 📝🔖 Write v1.1.0 release note by Romain Deville ([`5d007c0`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/5d007c0e6dc8f003905733905863285dd9225b49)) 🔏
  * 🔀 release-1.1.0 into master by Romain Deville ([`c12f432`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/c12f4320c1b829b17c70f1c6dabbd41d9eb83bab)) 🔏
  * 🔀 🔖v1.0.0 into develop by Romain Deville ([`07c0567`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/07c0567473154977fe6912f2e80c16d884ea4ba7)) 🔏
  * 🙈 Add .tmuxp.y*ml to gitignore by Romain Deville ([`76ac7f3`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/76ac7f3932fff60153c0890ae4a46a3756189965)) 🔏
  * 🚨 Fix shellcheck warnings by Romain Deville ([`41fc62f`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/41fc62fb049b2fa73e400b4735d9a0e162a089fe)) 🔏

## v1.0.0 (2022-01-07)

### ✨ Minor

  * ✨ Add src and template folder by Romain Deville ([`8ad0275`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/8ad0275093d69a4e25fd3f09b2df457b26eab8d0)) 🔏
  * ✨ Add all scripts for direnv by Romain Deville ([`22ffe92`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/22ffe92091e62d57f03383b3e29c789b00db4653)) 🔏

### 🩹 Patch

  * ➕📌 Add pinned dependencies for dev and prod by Romain Deville ([`6f9b9df`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/6f9b9df4d0c96a7399fff03a7e2eecaee735b973)) 🔏
  * 🔧 Update SHA1 of modified files by Romain Deville ([`e85ba88`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/e85ba882a077187d17054745930fe820d3ee4f5d)) 🔏
  * 🔧🚨 Fix shellcheck warning in pyproject.toml by Romain Deville ([`34f6e9b`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/34f6e9b917c7406eb65d347c1c55ae55cf9428c7)) 🔏
  * 🔧 Add SHA1 files by Romain Deville ([`1d1b957`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/1d1b9572f66008758e0bfa741ac8922d7400c6b8)) 🔏
  * 🔧 Add configuration files by Romain Deville ([`d8bc9a3`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/d8bc9a351bd3567f358083f8ca69d5bcb0c8c15a)) 🔏

### 🔊 Others

  * 🎉 Initial commit before git flow init by Romain Deville ([`676a879`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/676a879817b1bbe8c1e4a63c382887e2460c27f9)) 🔏
  * 🎉 Initial commit before git flow init by Romain Deville ([`3ad0be0`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/3ad0be066e4afb905df972a43e0187c240f62090)) 🔏
  * 👷‍ Add CI build by Romain Deville ([`f6f44b7`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/f6f44b7e1f532e62f012ee72b63a05362b540718)) 🔏
  * 📄 Add MIT and BEERWARE Licenses by Romain Deville ([`a4b7201`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/a4b7201acaa76efdcd8c3f7e171049ebe24fd018)) 🔏
  * 📝🔖 Write v1.0.0 release note by Romain Deville ([`b8aa903`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/b8aa90309613fec9cb08a62faf74707276513ed7)) 🔏
  * 📝 Add documentation files and config by Romain Deville ([`d28a7c6`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/d28a7c697cadc1b7b4e993686ce29ffe35f49aec)) 🔏
  * 📝 Add README.md by Romain Deville ([`8e93144`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/8e93144328079125313c4bd5e54c665e71a5502c)) 🔏
  * 🔀 release-1.0.0 into master by Romain Deville ([`b2cd18e`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/b2cd18e77e7d3f1456f31424a0950423d7a7c1af)) 🔏
  * 🚨 Fix shellcheck linter warning in bash scripts by Romain Deville ([`8589cea`](https://framagit.org/rdeville-public/dotfiles/direnv/-/commit/8589cea2c103362099969e5b1558854500828f15)) 🔏
