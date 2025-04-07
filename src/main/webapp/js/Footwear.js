let FootwearSelect = (i) =>{
    const shirt = document.getElementById('shirtSection');
    const tshirt = document.getElementById('tshirtSection');
    const hoodie = document.getElementById('hoodieSection');
    const jackets = document.getElementById('jacketSection')
    if(i==='sports'){
        shirt.classList.remove('d-none');
        tshirt.classList.add('d-none');
        hoodie.classList.add('d-none');
        jackets.classList.add('d-none');
    }else if(i==='formals'){
        shirt.classList.add('d-none');
        tshirt.classList.remove('d-none');
        hoodie.classList.add('d-none');
        jackets.classList.add('d-none');
    }else if(i==='chappal'){
        shirt.classList.add('d-none');
        tshirt.classList.add('d-none');
        hoodie.classList.remove('d-none');
        jackets.classList.add('d-none');
    }else if(i==='casual'){
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