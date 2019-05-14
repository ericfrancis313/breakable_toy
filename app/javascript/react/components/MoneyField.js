import React from 'react';

const MoneyField = (props) => {
  return (
    <select  onChange={props.handleChange}name="cost">
      <option value=""> click to select budget!</option>
      <option value="1"> $</option>
      <option value="2">$$</option>
      <option value="3">$$$</option>
      <option value="4">$$$$</option>
    </select>
  );
}

export default MoneyField;
