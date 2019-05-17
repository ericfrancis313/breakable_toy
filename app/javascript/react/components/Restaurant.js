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

    <p>
      <a href={props.content.url}> Learn more! </a>
    </p>
    <Movies/>
  </div>

  );
}

export default Restaurant;
