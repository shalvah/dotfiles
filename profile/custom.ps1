function global:Set-Kube ([String] $proj) {
    $Map = @{
        "hc-dev"  = "arn:aws:eks:eu-west-1:563178737752:cluster/HC-DevStage-App-EKS";
        "hc-prod" = "arn:aws:eks:eu-west-1:563178737752:cluster/HC-Production-App-EKS";
        "orderin-prod" = "arn:aws:eks:eu-west-1:843212092188:cluster/kroc-cluster";
    }

    kubectl config use-context $Map[$proj]

}

function global:Get-Kube () {
    kubectl config current-context
}

function global:Set-Gcloud ([String] $proj) {
    gcloud config set project $proj
}

function global:Get-Gcloud () {
    gcloud config get-value project
}

function global:Set-Aws ([String] $proj) {
    setx AWS_PROFILE $proj
}

function global:Get-Aws () {
    aws configure list
}