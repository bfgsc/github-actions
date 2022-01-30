# terraform-fmt

This action installs and runs [terraform-fmt].

## Inputs

No inputs required.

## Usage

```yml
  terraform-fmt:
    name: 'terraform-fmt'
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
      - name: 'running terraform-fmt'
        uses: './.github-actions/terraform-fmt'
```
