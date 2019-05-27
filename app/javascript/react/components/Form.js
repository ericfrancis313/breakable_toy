import React from "react"
import DistanceField from './DistanceField'
import TimeField from './TimeField'
import MoneyField from './MoneyField'
import Restaurant from './Restaurant'
import Movies from './Movies'
class Form extends React.Component{
  constructor (props){
    super(props);
    this.state={
      distance:'',
      time:'',
      budget:'',
      restaurant:null,
      movies:null

    }
    this.handleDistanceChange=this.handleDistanceChange.bind(this)
    this.handleTimeChange=this.handleTimeChange.bind(this)
    this.handleSubmit=this.handleSubmit.bind(this)
    this.clearForm = this.clearForm.bind(this)
    this.handleMoneyChange=this.handleMoneyChange.bind(this)
    this.handleRestaurantChange=this.handleRestaurantChange.bind(this)
    this.handleMovieChange=this.handleMovieChange.bind(this)
  }
  handleDistanceChange(event){
    this.setState({distance: event.target.value})
  }

  handleTimeChange(event){
    this.setState({time: event.target.value})
  }

  handleMoneyChange(event){
    this.setState({budget: event.target.value})
  }

  handleRestaurantChange(event){
    this.setState({restaurant: event.target.value})
  }

  handleMovieChange(event){
    this.setState({movies:event.target.value})
  }

  clearForm(){
    this.setState({distance: '', time:''})
  }

  handleSubmit(event){
    event.preventDefault()
      fetch(`/api/v1/restaurants/search`,{
        credentials: 'same-origin',
        method: "POST",
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
        body: JSON.stringify({date:this.state})
      })
      .then(response => {
        if (response.ok) {

          return response
        } else {
          let errorMessage = `${response.status}(${response.statusText})`,
          error = new Error(errorMessage);
          throw(error);
        }
      })
      .then(response => response.json())
      .then(body => {
        let date= body["businesses"]
         date = date[Math.floor(Math.random() * date.length)]
        let coordinates = date.coordinates
        this.setState({
          restaurant:date
        })
        debugger
      })
      .then(
        fetch(`/api/v1/movies/search`,{
          credentials: 'same-origin',
          method: "POST",
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json'
          },
          body: JSON.stringify({date:this.state})
        })
      )
      .then(response => {
        if (response.ok) {
          return response
        } else {
          let errorMessage = `${response.status}(${response.statusText})`,
          error = new Error(errorMessage);
          throw(error);
        }
      })
      .then(response => response.json())
      .then(body => {
        this.setState({

        })
      })
      .catch(error => console.error(`Error in fetch: ${error.message}`));

  }
    render(){
    let restaurant;
    if (this.state.restaurant != null){
      restaurant=(
        <Restaurant content={this.state.restaurant} handleChange={this.handleRestaurantChange} />
      )
    }
    let movies;
    if (this.state.movies != null){
      movies=(
        <Movies content={this.state.movies} handleChange={this.handleMovieChange} coordinates={this.coordinates} />
      )
    }
    return(
      <div>
        <form className="dateForm" onSubmit={this.handleSubmit}>
          <h4 className="title"> DateNight </h4>
          <h5> Enter zip code!</h5>
            <DistanceField content={this.state.distance} handleChange={ this.handleDistanceChange}/>
          <h5>What time is your date?</h5>
            <TimeField content={this.state.time} handleChange={ this.handleTimeChange}/>
          <h5>What's your budget?</h5>
            <MoneyField content={this.state.budget}handleChange={ this.handleMoneyChange} />
          <input type="submit" value="Make Date!" />
        </form>
        {restaurant}
      </div>
    )
  }
}

export default Form
