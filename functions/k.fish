function k -d 'namespace-aware kubectl alias' --wraps=kubectl
    if set --query NS
        kubectl -n $NS $argv
    else if set --query namespace
        kubectl -n $namespace $argv
    else
        kubectl $argv
    end
end
