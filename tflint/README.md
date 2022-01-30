# tflint

This action installs and runs [tflint].

## Inputs

No inputs required.

## Usage

```yml
  tflint:
    name: 'tflint'
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
      - name: 'running tflint'
        uses: './.github-actions/tflint'
```
