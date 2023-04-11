# Set the API endpoint and API key
$url = "https://imdb-api.com/en/API/SearchMovie/"
$apiKey = "k_0nwz2nx6"

# Set the movie title to search for
$movie = Read-Host -Prompt "Movie Title: "
#Write-Host "Movie Title: $movie"
#$movie = "inception 2010"

# Set the request parameters
$params = "?apiKey=$apiKey&expression=$movie"

# Send the API request and get the response using the wget command
$response = wget -UseBasicParsing "$url$params"

# Convert the response content to a JSON object
$movieData = $response.Content | ConvertFrom-Json

# Check if any movies were found
if ($movieData.results) {
    # Loop through the movies and print the details
    $movieData.results | ForEach-Object {
        Write-Host "Title: $($_.title)"
        Write-Host "Description: $($_.description)"
        Write-Host "IMDb ID: $($_.id)"
        Write-Host "Poster URL: $($_.image)"
		 Write-Host "Year: $($_.year)"
        Write-Host
    }
} else {
    Write-Host "No movies found."
}
