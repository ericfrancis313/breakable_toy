import React from 'react';

const MoneyField = (props) => {
  return (
    <select  onChange={props.handleChange}name="cost">
      <option value=""> click to select budget!</option>
      <option value="$"> $</option>
      <option value="$$">$$</option>
      <option value="$$$">$$$</option>
      <option value="$$$$">$$$$</option>
    </select>
  );
}

export default MoneyField;
