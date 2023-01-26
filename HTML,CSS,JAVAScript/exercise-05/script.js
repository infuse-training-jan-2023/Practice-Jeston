
function fetchPokemon() {
    fetch("https://pokeapi.co/api/v2/pokemon?offset=0&limit=20")
        .then(response => response.json())
        .then(function (allpokemon) {
            allpokemon.results.forEach(function (pokemon) {
                let url = pokemon.url
                fetch(url)
                    .then(response => response.json())
                    .then(function (pokeData) {
                        renderPokemon(pokeData)
                    })
            })
        })
}

let temp = null;
function fetchdetails(id) {
    console.log("fetch details")
    console.log("https://pokeapi.co/api/v2/pokemon/" + id + "/")
    fetch("https://pokeapi.co/api/v2/pokemon/" + id + "/")
        .then(response => response.json())
        .then(allpokemon => storedata(allpokemon))
}

function storedata(allpokemon) {
    let abilities_data=allpokemon.abilities;
    let types_data=allpokemon.types
    let moves_data=allpokemon.moves

    console.log(allpokemon.moves)

       let abilities_list = abilities_data.map((object) => {
        let ab = `${object.ability.name}`
        return ab;
       })

       let types_list = types_data.map((object) => {
        let ab = `${object.type.name}`
        return ab;
       })

       let moves_list = moves_data.map((object) => {
        let ab = `${object.move.name}`
        return ab;
       })

    //    let moves_list_names = moves_list.map((object) => {
    //     let ab = `${object.move}`
    //     return ab;
    //    })

       let moves_string=moves_list.slice(0,moves_list.length);

       console.log(moves_string);
    
    
    document.getElementById('iload').srcdoc = `<html>
    <head>
    </head>
    <body>
    <p align="center" margin-top="-55px"> <b>Name : ${allpokemon.name} </b></p>
    <img src="${allpokemon.sprites.front_default}" height="300px" weight="400px"/></body>
    <p>Abilities:</p>
    <ul id="myList">
        <li> ${abilities_list[0]}</li>
        <li> ${abilities_list[1]}</li>   
    </ul>
    <p>Height: ${allpokemon.height}  </p>
    <p>Types:</p>
    <ul id="myList">
        <li> ${types_list[0]}</li>
        <li> ${types_list[1]}</li>   
    </ul>
    <p id="moves">Moves:${moves_list.slice(0,5)}</p>
    <button id="btn" onclick="loadmoves()">More moves</button>
    </body>
    <script>
    let list = document.getElementById("myList");
    function loadmoves(){
       console.log("clicked");
       let element=document.getElementById("moves");
       element.innerText="Moves : ${moves_list.slice(0,moves_list.length)}";
       
    }
   
    </script>
    </html>`;
}

let tempArr = [];
function renderPokemon(pokeData) {
    let allPokemonContainer = document.getElementById('container2')

    // let allPokemonContainer = document.getElementById('poke-container');
    let pokeContainer = document.createElement("div") //div will be used to hold the data/details for indiviual pokemon.{}
    pokeContainer.style.height = 370
    pokeContainer.style.width = 50
    pokeContainer.className = "card"

    let pokeName = document.createElement('h3')
    pokeName.innerText = "Name :" + pokeData.name
    pokeName.className = "name"

    let poke_details = document.createElement('button')
    // poke_details.target="Details"
    // poke_details.href="file://home/jestonfernandes/Downloads/um-exercises-main/exercise-02/index.html"
    // poke_details.text="Load more"
    poke_details.name = "Load More"
    poke_details.addEventListener("click", onLoadMore)
    poke_details.id = `#${pokeData.id}`
    poke_details.style.height = "20px"
    poke_details.style.width = "150px"
    poke_details.textContent = "Click for more details"

    let pokeweight = document.createElement('h4')
    pokeweight.innerText = "\tWeight :" + pokeData.weight
    pokeweight.className = "weight"
    let pokeexperience = document.createElement('h4')
    pokeexperience.name = "pke"
    pokeexperience.class = "pkc"
    pokeexperience.innerText = "\tBase_experience :" + pokeData.base_experience
    let poke_hp = document.createElement('h4')
    poke_hp.innerText = "\tHp : " + pokeData.stats[0].base_stat
    let pokeNumber = document.createElement('p')
    pokeNumber.innerText = `#${pokeData.id}`
    let pokeImage = document.createElement('img')
    pokeImage.src = pokeData.sprites.front_default



    let frontImage = pokeData.sprites.front_default
    let backImage = pokeData.sprites.back_default


    pokeImage.addEventListener("mouseover", onHover);
    pokeImage.addEventListener("mouseout", offHover);


    pokeImage.height = 120
    pokeImage.width = 130
    pokeImage.className = "myimage"
    pokeImage.id = `#${pokeData.id}`
    pokeContainer.append(pokeName, pokeImage, pokeNumber, pokeweight, pokeexperience, poke_hp, poke_details);
    //appending all details to the pokeContainer div
    allPokemonContainer.appendChild(pokeContainer);


    function onHover(e) {
        console.log("onHover")
        document.getElementById(e.target.id).src = backImage;
        //this.src=backImage;
    }

    function onLoadMore(e) {
        console.log("onclick")
        console.log((e.target.id).slice(1))


        fetchdetails((e.target.id).slice(1));


        //this.src=backImage;
    }

    
    function offHover(e) {
        document.getElementById(e.target.id).src = frontImage;
    }

    let value=document.getElementById('sort')
console.log(value.value)
switch(value.value) {
    case 0:
        console.log("case 0");
        SortData_w()
      // code block
      break;
    case 1:
      // code block
      SortData_be
      break;
      case 2:
        // code block
        SortData_n
        break;
    default:
      // code block
  }

}


function SortData_w() {
    console.log("weight called");

    const sortedElements = [...document.querySelectorAll('.card')]
        .sort((a, b) => a.childNodes[3].innerText.split(":")[1] - b.childNodes[3].innerText.split(":")[1]);
    // console.log(sortedElements);
    document.getElementById("container2").append(...sortedElements);
    // priceNodes.forEach((node,index)=>{
    // node.replaceWith(sortedPriceNodes[index])
    // })
}



function SortData_be() {

    const sortedElements = [...document.querySelectorAll('.card')]
        .sort((a, b) => a.childNodes[4].innerText.split(":")[1] - b.childNodes[4].innerText.split(":")[1]);
    // console.log(sortedElements);
    document.getElementById("container2").append(...sortedElements);
    console.log(sortedElements[0].childNodes[4].innerText.split(":")[1]);
    // priceNodes.forEach((node,index)=>{
    // node.replaceWith(sortedPriceNodes[index])
    // })
}

function SortData_n() {

    const sortedElements = [...document.querySelectorAll('.card')]
        .sort((a, b) => a.childNodes[0].innerText.localeCompare(b.childNodes[0].innerText));
    // console.log(sortedElements);
    document.getElementById("container2").append(...sortedElements);
    console.log(sortedElements[0].childNodes[0].innerText);
    // priceNodes.forEach((node,index)=>{
    // node.replaceWith(sortedPriceNodes[index])
    // })
}

function filter() {
    let input = document.querySelector('.searchbar').value //<-- Changed to querySelector
    input = input.toLowerCase();
    let cards = document.querySelectorAll('.card'); //<-- Changed to querySelectorAll with '.card' selector.

    //loop over cards and compare search with title.
    cards.forEach((el) => {
        let title = el.querySelector('.name').textContent.toLowerCase();
        el.style.display = title.includes(input) ? "list-item" : "none";
    });
}

fetchPokemon();