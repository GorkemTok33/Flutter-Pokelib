# Flutter-Pokelib
<p>Hi everyone, I m trying to learn flutter and I have two months experience. I coded a simple pokedex mobile application. That contains provider architech, custom routing,
find dominat color with palette generator,
send request to api and get response from api.</p>
<br>
# Lets take a look how my application run ? 
<p>First when you opened app you will see splash screen. In the splash screen i m checking your mobile phone wifi or mobile data for is opened if is open i m checking your network connection with internet address lookup function if internet address lookup function success, sending request to the  "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json" for the getting pokemon data. Routing to the home screen if pokemon data is not empty. In the home screen im used listview.builder for the listing pokemons and used textfield for searching in pokemon list. The list is actually listening the pokemon view list. listview.builder will reflesh If list changed with searching operation. Every listview.builder items has dominat color of the pokemon picture. When you click items you will route to detail screen. In the detail screen you can see pokemon detail.</p>
