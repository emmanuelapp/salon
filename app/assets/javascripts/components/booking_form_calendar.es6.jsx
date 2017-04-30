class BookingFormCalendar extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      availableDates: [],
      offerId: ''
    }

    this.handleSelection = this.handleSelection.bind(this);
  }

  handleSelection(data) {
    this.setState({
      availableDates: data['available'],
      offerId: this.props.offerId
    });
  }

  render () {
    if (this.props.offerId !== '' && this.state.offerId !== this.props.offerId) {
      path = `/api/v1/reservation_dates/?offer_id=${this.props.offerId}`
      $.get(path, this.handleSelection)
    }

    if (this.props.offerId === '') {
      this.setState({availableDates: []});
    }

    return(
      <div>
        <label>Reservation time and date</label>

        <div className='form-group'>
          <div className="input-group">
            <span className="input-group-addon">
              <span className="glyphicon glyphicon-calendar" aria-hidden="true"></span>
            </span>

            <select className='form-control' onChange={this.props.onChange} required={true}>
              <option default value=''>Select time and date</option>
              {this.state.availableDates.map((date) => <option key={date}>{date}</option>)}
            </select>
          </div>
        </div>
      </div>
    );
  }
}
