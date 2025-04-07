let UnderGarmentsSelect = (i) =>{
    const shirt = document.getElementById('shirtSection');
    const tshirt = document.getElementById('tshirtSection');
    const hoodie = document.getElementById('hoodieSection');
    if(i==='underShirts'){
        shirt.classList.remove('d-none');
        tshirt.classList.add('d-none');
        hoodie.classList.add('d-none');
    }else if(i==='Underwear'){
        shirt.classList.add('d-none');
        tshirt.classList.remove('d-none');
        hoodie.classList.add('d-none');
    }else if(i==='Socks'){
        shirt.classList.add('d-none');
        tshirt.classList.add('d-none');
        hoodie.classList.remove('d-none');
    }else{
        shirt.classList.remove('d-none');
        tshirt.classList.add('d-none');
        hoodie.classList.add('d-none');
    }
}