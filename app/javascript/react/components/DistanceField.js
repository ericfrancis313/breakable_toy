import React from 'react';

const DistanceField = (props) => {
  return (
    <label>{props.label}
        <input
          type='text'
          value={props.content}
          onChange={props.handleChange}
        />
      </label>
  );
}

export default DistanceField;
