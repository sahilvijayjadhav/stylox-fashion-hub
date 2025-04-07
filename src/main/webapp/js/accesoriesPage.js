let AccesoriesSelect = (i) =>{
    const shirt = document.getElementById('shirtSection');
    const tshirt = document.getElementById('tshirtSection');
    const hoodie = document.getElementById('hoodieSection');
    const jackets = document.getElementById('jacketSection')
    if(i==='watches'){
        shirt.classList.remove('d-none');
        tshirt.classList.add('d-none');
        hoodie.classList.add('d-none');
        jackets.classList.add('d-none');
    }else if(i==='perfume'){
        shirt.classList.add('d-none');
        tshirt.classList.remove('d-none');
        hoodie.classList.add('d-none');
        jackets.classList.add('d-none');
    }else if(i==='caps'){
        shirt.classList.add('d-none');
        tshirt.classList.add('d-none');
        hoodie.classList.remove('d-none');
        jackets.classList.add('d-none');
    }else if(i==='Belts'){
        shirt.classList.add('d-none');
        tshirt.classList.add('d-none');
        hoodie.classList.add('d-none');
        jackets.classList.remove('d-none');
    }else{
        shirt.classList.remove('d-none');
        tshirt.classList.add('d-none');
        hoodie.classList.add('d-none');
        jackets.classList.add('d-none');
    }
}