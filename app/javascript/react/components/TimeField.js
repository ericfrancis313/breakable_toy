import React from 'react';

const TimeField = (props) => {
  return (
  <input onChange={props.handleChange}type="time" />
  );
}

export default TimeField;
