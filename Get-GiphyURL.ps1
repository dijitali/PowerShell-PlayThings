 Function Get-GiphyURL
{
    Param
    (
        [Parameter(Mandatory=$True)] 
        [string] $SearchString
    )
     $stringMatch = $SearchString | Select-String -Pattern '[a-zA-Z0-9]+' -AllMatches

    if($stringMatch)
    {
        $sanitisedSearchString = $stringMatch.Matches.Value -join '+'
    }
    else
    {
        throw ('Invalid SearchString: ' + $SearchString)
    } 
    
    Write-Verbose -Message ('Searching Giphy for: ' + $sanitisedSearchString)
    $giphyResponse = Invoke-RestMethod -Method Get -Uri ('http://api.giphy.com/v1/gifs/search?q=' + $sanitisedSearchString + '&api_key=dc6zaTOxFJmzC')  -ErrorAction Stop
    $index = Get-Random -Minimum 0 -Maximum $giphyResponse.data.Length
    
    return $giphyResponse.data[$index].images.original.url
} 
