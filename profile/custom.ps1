function global:Set-Kube ([String] $proj) {
    $Map = @{
        "hc-dev"  = "arn:aws:eks:eu-west-1:563178737752:cluster/HC-DevStage-App-EKS";
        "hc-prod" = "arn:aws:eks:eu-west-1:563178737752:cluster/HC-Production-App-EKS";
    }

    kubectl config use-context $Map[$proj]

}

function global:Get-Kube () {
    kubectl config current-context
}

function global:Set-Gcloud ([String] $proj) {
    $Map = @{
        "deimos"  = "";
    }

    gcloud config set project $Map[$proj]

}

function global:Get-Gcloud () {
    gcloud config get project
}