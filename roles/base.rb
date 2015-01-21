name "base"
description 'Base role applied to all nodes'

run_list(
    'recipe[git]',
    'recipe[build-essential]',
    'recipe[myairwatch-install-user]'
)

