# tfsec

This action installs and runs [tfsec].

## Inputs

`excludes` is a comma deliminted string of skips to ignore. (optional)

## Usage

```yml
  tfsec:
    name: 'tfsec'
    runs-on: 'self-hosted'
    steps:
      - uses: 'actions/checkout@v2'
      - name: 'Checkout GitHub actions repo'
        uses: 'actions/checkout@v2'
        with:
          repository: 'sharksrus/github-actions'
          token: '${{ secrets.SHARK_CI_TOKEN }}'
          path: '.github-actions'
          ref: 'main'
      - name: 'Run tfsec'
        uses: './.github-actions/tfsec'
        with:
          excludes: 'AWS0097' ## this is optional
```
