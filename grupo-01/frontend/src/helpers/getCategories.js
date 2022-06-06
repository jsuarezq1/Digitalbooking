const getCategories = async () => {
     
    try{
        const url = '/categories';
        const respuesta = await fetch(url);
        const {data} = await respuesta.json();

        /* const category = data.map( e => (
            {
                id: e.id,
                title: e.description,
                description: e.title,
                url: e.urlImage
            }
        )) */
        
        return data;

    } catch (error){
        console.warn(error);
    }
}

getCategories()