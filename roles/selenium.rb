name 'selenium_hub'
description 'This role applies selenium hub recipes to a server'

hub_env = [
    'recipe[start-hub]'
]

node_env = [
    'recipe[start-node]'
]

default_env = [

]

env_run_lists(
    '_default' => default_env,
    'hub' => hub_env,
    'node' => node_env
)