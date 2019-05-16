import React from 'react';

const Restaurant = (props) => {

  return (
  <div className="restaurant" onChange={props.handleChange}>
    <p>
    {props.content.name}
    </p>
    <p>
    <img src={props.content.image_url}/>
    </p>
    <p>
    {props.content.location.display_address[0]}
    </p>
    {props.content.location.display_address[1]}
    <p>
    {props.content.display_phone}
    </p>

    <a href={props.content.url}> Learn more! </a>
  </div>

  );
}

export default Restaurant;
