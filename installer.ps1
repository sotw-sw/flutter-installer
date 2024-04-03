$Tags = Invoke-RestMethod -Uri https://api.github.com/repos/flutter/flutter/git/refs/tags -Method Get -ContentType 'application/json'

for ($i = 0; $i -lt $RefreshTagsJson.Length; $i++) {
    $Tag = $Tags[$Tags.Length - 1 - $i]
    if ($Tag.ref -match '^refs/tags/\d+\.\d+\.\d+$') {
        $LatestVersion = [regex]::Match($Tag.ref, '^refs/tags/(\d+\.\d+\.\d+)$').Groups[1].Value
        break
    }
}

$DownloadURL = "https://storage.googleapis.com/flutter_infra_release/releases/stable/windows/flutter_windows_$LatestVersion-stable.zip"
