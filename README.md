# Flutter-Pokelib
<p>Hi everyone, I m trying to learn flutter and I have two months experience. I coded a simple pokedex mobile application. That contains provider for state management, custom routing,
find dominat color with palette generator,
send request to api and get response from api.</p>
<h3>Lets take a look how my application run ?</h3> 
<p>First when you opened app you will see splash screen. In the splash screen i m checking your mobile phone wifi or mobile data for is opened if is open i m checking your network connection with internet address lookup function if internet address lookup function success, sending request to the  "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json" for the getting pokemon data. Routing to the home screen if pokemon data is not empty. In the home screen i used listview.builder for the listing pokemons and used textfield for searching in pokemon list. The list is actually listening the pokemon view list. listview.builder will reflesh If list changed with searching operation. Every listview.builder items has dominat color of the pokemon picture. When you click items you will route to detail screen. In the detail screen you can see pokemon detail.</p>

<h3>Screenshots</h3>
<table>
  <tr>
    <th>Splash Screen</th>
    <th>Home Screen</th>
    <th>Detail Screen</th>
  </tr>
  <tr>
    <td><img src='https://user-images.githubusercontent.com/79594881/153775956-0c1a6d2c-adb5-43fe-9022-bad396a011cd.png'/></td>
    <td><img src='https://user-images.githubusercontent.com/79594881/153775958-b1356543-330b-47a8-9e27-eb3e03729246.png'/></td>
    <td><img src='https://user-images.githubusercontent.com/79594881/153775954-859ecfa9-74d1-4385-b69b-377342661ccf.png'/></td>
  </tr>
  <tr>
    <th>Home Screen Search</th>
    <th>Error Screen</th>
  </tr>
  <tr>
    <td><img src='https://user-images.githubusercontent.com/79594881/153775960-d381d521-aba5-4906-bf5a-ef6c879b7b28.png'/></td>
     <td><img src='https://user-images.githubusercontent.com/79594881/153776022-de6f4518-baa9-486a-868c-6d934445d80d.png'/></td>
  </tr>
</table>
<br>
<br>
<b>Thank you for reading</b>
