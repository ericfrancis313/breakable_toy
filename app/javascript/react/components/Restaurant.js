import React from 'react';
import Movies from './Movies'
const Restaurant = (props) => {

  return (
  <div className="restaurant" onChange={props.handleChange}>
    <p>
      {props.content.name}
    </p>
    <p>
      <img className='yelpPic'src={props.content.image_url}/>
    </p>
    <p>
      {props.content.location.display_address[0]}
    </p>
    <p>
      {props.content.location.display_address[1]}
    </p>
    <p>
      {props.content.display_phone}
    </p>
<<<<<<< HEAD
=======

>>>>>>> a1910decd9e786f14e97ef5a5e44e1453039fdc1
    <p>
      <a href={props.content.url}> Learn more! </a>
    </p>
    <Movies/>
  </div>
  );
}

export default Restaurant;
