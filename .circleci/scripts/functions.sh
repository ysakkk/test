#!/bin/bash

function check-commit-message() {

  _triggers=(build redmine base-system base-system-dev)
  _clients_list=(aidis bno develop ensky liica mind pixyda rdl rizap rhems diarkis survey drecom)
  _base_system_list=(karpenter storageclass admin)

  function output-params() {
    PARAM=$(
      printf '{"trigger":"%s", "clients":"%s", "apply-base":"%s"}' "${TRIGGER}" "${CLIENTS[*]}" "${APPLY_BASE[*]}"| jq
    )
    echo "$PARAM" > param.json
  }
  commit_subject=$(git log -1 --pretty=%s.)
  echo -e "---commit_subject---\n${commit_subject}\n"

  ### parameters check

  # Count the number of brackets
  _bracket_count=$(echo $commit_subject | awk '{count += (split($0, a, "\[|\]") - 1)} END{print count}')
  # echo "_bracket_count=${_bracket_count}"

  # param 1 (trigger)
  if [ "$(echo $commit_subject | grep -E '\[.+\]')" ]; then

    _trigger=$(echo $commit_subject | awk -F'\\[|\\]|"' '{print $2}')
    echo "_trigger=$_trigger"
  fi

  ### trigger check (build / redmine)
  if [ "$(echo $_trigger | grep 'build')" ]; then
    TRIGGER='build'
  elif [ "$(echo $_trigger | grep 'redmine')" ]; then
    TRIGGER='redmine'
  elif [ "$(echo $_trigger | grep 'base-system')" ]; then
    if [ "$(echo $_trigger | grep 'base-system-dev')" ]; then
      TRIGGER='base-system-dev'
    else
      TRIGGER='base-system'
    fi
  fi

  if [ -z "${TRIGGER}" ]; then
    echo 'no trigger'
    output-params
    cat param.json
    exit 0
  fi

  ### redmine clients check
  if [[ "$TRIGGER" == "redmine" ]]; then
    _clients=$(echo $_trigger | awk -F':' '{print $2}')
    echo $_clients
    IFS=, _clients=($(echo "${_clients}" | tr -d ' '))
    echo "_clients=${_clients[@]}"
    for str in "${_clients[@]}"; do
      for check in "${_clients_list[@]}"; do
        if [[ $check == $str ]]; then
          CLIENTS+=($check)
        fi
      done
    done
  ### apply base-system check
  elif [[ "$TRIGGER" == "base-system" ]]; then
    _components=$(echo $_trigger | awk -F':' '{print $2}')
    echo $_components
    IFS=, _components=($(echo "${_components}" | tr -d ' '))
    echo "_components=${_components[@]}"
    for str in "${_components[@]}"; do
      for check in "${_base_system_list[@]}"; do
        if [[ $check == $str ]]; then
          APPLY_BASE+=($check)
        fi
      done
    done
  ### apply base-system-dev check
  elif [[ "$TRIGGER" == "base-system-dev" ]]; then
    _components=$(echo $_trigger | awk -F':' '{print $2}')
    echo $_components
    IFS=, _components=($(echo "${_components}" | tr -d ' '))
    echo "_components=${_components[@]}"
    for str in "${_components[@]}"; do
      for check in "${_base_system_list[@]}"; do
        if [[ $check == $str ]]; then
          APPLY_BASE+=($check)
        fi
      done
    done
  fi

  IFS=$' \t\n'
  output-params
}
