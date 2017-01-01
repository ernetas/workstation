# README

Simple use case: create site.pp with contents for desktop:
```
include '::workstation'
```

For server:
```
include '::workstation::server'
```

Run:
```
make
```

or:
```
puppet apply site.pp --modulepath ./ --debug
```
