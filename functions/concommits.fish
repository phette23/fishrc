function concommits -d 'Print a list of conventional commit types'
    echo -e " Type       Description" \
        "\n build      Change to build system or external dependencies" \
        "\n ci         Changes to CI configuration" \
        "\n chore      Other changes that don't modify code (often dependency upgrades)" \
        "\n docs       Documentation" \
        "\n feat       New feature" \
        "\n fix        Bug fix" \
        "\n perf       Performance improvement" \
        "\n refactor   Code change that neither fixes a bug nor adds a feature" \
        "\n revert     Reverts a prior commit" \
        "\n style      Coding style (no functional effect)" \
        "\n test       Adding or correcting tests"
end
