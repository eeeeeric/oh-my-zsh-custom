function reload-kubeconfigs {
  # Combine kubeconfigs into ':'-delimited list as KUBECONFIG, which will be auto-merged by kubectl
  local default="${HOME}/.kube/config"
  local config_dir="${HOME}/.kube/config.d"
  local config_paths=""
  function __join { local IFS="$1"; shift; echo "$*"; }
  if [[ -n "$(ls "$config_dir")" ]]; then
    local configs=( "${config_dir}/"* )
    config_paths="$(__join : "${configs[@]}")"
  fi
  if [[ -f "$default" ]]; then
    config_paths="${default}:${config_paths}"
  fi
  export KUBECONFIG="$config_paths"
}
reload-kubeconfigs

source <(kubectl completion zsh)

destroykube() {
  kubectl delete daemonsets,replicasets,services,deployments,pods,rc --all
}
