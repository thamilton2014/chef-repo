name 'test'
description 'test server role'

all_env = [
    'role[base]',
    'recipe[myairwatch-install-user]'
]

run_list(all_env)

env_run_lists(
    '_default' => all_env,
    'test' => all_env
)