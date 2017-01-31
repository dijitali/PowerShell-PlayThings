 Function Get-GiphyURL
{
    Param
    (
        [string] $SearchString = 'funny+cat'
    )

    $giphyResponse = Invoke-RestMethod -Method Get -Uri ('http://api.giphy.com/v1/gifs/search?q=' + $SearchString + '&api_key=dc6zaTOxFJmzC')

    $index = Get-Random -Minimum 0 -Maximum $giphyResponse.data.Length
    
    return $giphyResponse.data[$index].images.original.url
} 
