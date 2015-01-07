name 'test'
description 'test server role'

all_env = [
    'role[base]',
    'recipe[myairwatch-ssh-keys]'
]

run_list(all_env)

env_run_lists(
    '_default' => all_env,
    'test' => all_env
)