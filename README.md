# Flutter-Pokelib
<p>Hi everyone, I m trying to learn flutter and I have two months experience. I coded a simple pokedex mobile application. That contains provider architech, custom routing,
find dominat color with palette generator,
send request to api and get response from api.</p>
<h3>Lets take a look how my application run ?</h3> 
<p>First when you opened app you will see splash screen. In the splash screen i m checking your mobile phone wifi or mobile data for is opened if is open i m checking your network connection with internet address lookup function if internet address lookup function success, sending request to the  "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json" for the getting pokemon data. Routing to the home screen if pokemon data is not empty. In the home screen im used listview.builder for the listing pokemons and used textfield for searching in pokemon list. The list is actually listening the pokemon view list. listview.builder will reflesh If list changed with searching operation. Every listview.builder items has dominat color of the pokemon picture. When you click items you will route to detail screen. In the detail screen you can see pokemon detail.</p>

<h3>Screenshots</h3>
<table>

  <tr>
    <th>Splash Screen</th>
    <th>Home Screen</th>
    <th>Detail Screen</th>
  </tr>
  <tr>
    <td><img src='https://user-images.githubusercontent.com/79594881/153772712-7266636e-d99e-4059-bfc1-02cf3c15f426.png'/></td>
    <td><img src='https://user-images.githubusercontent.com/79594881/153772735-59ccded1-a77f-4db5-b85b-85dc016c93ce.png'/></td>
    <td><img src='https://user-images.githubusercontent.com/79594881/153772751-dc4c75f1-bdcd-4bfe-b0d2-663572130a3f.png'/></td>
  </tr>
</table>
