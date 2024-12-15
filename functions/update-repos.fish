function update-repos --description "Updates repos in the specified directory or ~/Documents/GitHub/github.com by default without updating dirty repos or submodules"
    # Display help message if --help is passed
    if test (count $argv) -gt 0 -a "$argv[1]" = "--help"
        echo "Usage: update-repos [DIRECTORY]"
        echo ""
        echo "Updates Git repositories in the specified DIRECTORY or in ~/Documents/GitHub/github.com if no directory is provided."
        echo ""
        echo "Options:"
        echo "  --help       Display this help message and exit."
        echo ""
        echo "Behavior:"
        echo "  - Skips repositories with uncommitted changes (dirty repositories)."
        echo "  - Skips updating submodules if present."
        echo "  - Skips repositories if the current Git user lacks pull permissions."
        echo "  - Fetches and pulls the latest changes using 'git fetch --all' and 'git pull --rebase'."
        echo ""
        echo "Examples:"
        echo "  update-repos                  # Update repos in ~/Documents/GitHub/github.com"
        echo "  update-repos /custom/path     # Update repos in /custom/path"
        return 0
    end

    # Set default directory if no argument is passed
    set github_dir (count $argv > /dev/null; and echo $argv[1]; or echo ~/Documents/GitHub/github.com)

    if not test -d $github_dir
        echo "Directory $github_dir does not exist."
        return 1
    end

    for repo in (find $github_dir -mindepth 1 -maxdepth 2 -type d)
        echo "Checking $repo..."
        cd $repo

        if test -d .git
            # Check if the current Git user has pull permissions
            if not git ls-remote > /dev/null 2>&1
                echo "Skipping $repo (insufficient permissions to pull)"
                continue
            end

            # Check if the repo has uncommitted changes
            if not git diff-index --quiet HEAD --
                echo "Skipping $repo (dirty repository)"
            else
                echo "Updating $repo..."
                git fetch --all
                git pull --rebase

                # Check if the repo has submodules
                if git config --file .gitmodules --get-regexp "path" > /dev/null
                    echo "Skipping submodule updates for $repo"
                end
            end
        else
            echo "$repo is not a git repository. Skipping..."
        end

        cd - > /dev/null
    end
end
