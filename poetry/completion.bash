_poetry_1b7d258791038f59_complete()
{
    local cur script coms opts com
    COMPREPLY=()
    _get_comp_words_by_ref -n : cur words

    # for an alias, get the real script behind it
    if [[ $(type -t ${words[0]}) == "alias" ]]; then
        script=$(alias ${words[0]} | sed -E "s/alias ${words[0]}='(.*)'/\1/")
    else
        script=${words[0]}
    fi

    # lookup for command
    for word in ${words[@]:1}; do
        if [[ $word != -* ]]; then
            com=$word
            break
        fi
    done

    # completing for an option
    if [[ ${cur} == --* ]] ; then
        opts="--ansi --help --no-ansi --no-interaction --quiet --verbose --version"

        case "$com" in

            (about)
            opts="${opts} "
            ;;

            (add)
            opts="${opts} --allow-prereleases --dev --dry-run --extras --lock --optional --platform --python --source"
            ;;

            (build)
            opts="${opts} --format"
            ;;

            (cache)
            opts="${opts} "
            ;;

            (check)
            opts="${opts} "
            ;;

            (config)
            opts="${opts} --list --local --unset"
            ;;

            (debug)
            opts="${opts} "
            ;;

            (env)
            opts="${opts} "
            ;;

            (export)
            opts="${opts} --dev --extras --format --output --with-credentials --without-hashes"
            ;;

            (help)
            opts="${opts} "
            ;;

            (init)
            opts="${opts} --author --dependency --description --dev-dependency --license --name --python"
            ;;

            (install)
            opts="${opts} --dry-run --extras --no-dev --no-root --remove-untracked"
            ;;

            (lock)
            opts="${opts} --no-update"
            ;;

            (new)
            opts="${opts} --name --src"
            ;;

            (publish)
            opts="${opts} --build --cert --client-cert --dry-run --password --repository --username"
            ;;

            (remove)
            opts="${opts} --dev --dry-run"
            ;;

            (run)
            opts="${opts} "
            ;;

            (search)
            opts="${opts} "
            ;;

            (self)
            opts="${opts} "
            ;;

            (shell)
            opts="${opts} "
            ;;

            (show)
            opts="${opts} --all --latest --no-dev --outdated --tree"
            ;;

            (update)
            opts="${opts} --dry-run --lock --no-dev"
            ;;

            (version)
            opts="${opts} --short"
            ;;

        esac

        COMPREPLY=($(compgen -W "${opts}" -- ${cur}))
        __ltrim_colon_completions "$cur"

        return 0;
    fi

    # completing for a command
    if [[ $cur == $com ]]; then
        coms="about add build cache check config debug env export help init install lock new publish remove run search self shell show update version"

        COMPREPLY=($(compgen -W "${coms}" -- ${cur}))
        __ltrim_colon_completions "$cur"

        return 0
    fi
}

complete -o default -F _poetry_1b7d258791038f59_complete poetry
complete -o default -F _poetry_1b7d258791038f59_complete /Users/tp5/.pyenv/versions/3.10.0/bin/poetry
