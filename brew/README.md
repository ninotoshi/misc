This script installs or upgrades brew (cask) applications.

**ex.** install or upgrade `readline` and `sqlite`. If `readline` is installed, but `sqlite`, then `readline` is upgraded, and `sqlite` is installed.

```sh
./setup.sh readline sqlite
```

**ex. ** only install `readline` and `sqlite` if not installed. No upgrades will be done.

```sh
./setup.sh -i readline sqlite
```

**ex. ** install or upgrade `atom` and `vagrant` with cask options.

```sh
HOMEBREW_CASK_OPTS="--caskroom=/usr/local/opt/Caskroom" ./setup.sh -c atom vagrant
```

*Note:* With `-c`, it is always installation only.
