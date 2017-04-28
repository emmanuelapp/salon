class OffersDropdown extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      offers: [],
      offerId: ''
    };

    this.handleOffer = this.handleOffer.bind(this);
  }

  componentDidMount() {
    $.ajax({
      url: '/api/v1/offers',
      dataType: 'json',
      cache: false,
      success: ((data) => this.setState({offers: data})).bind(this),
      error: ((xhr, status, err) => alert('An arror occured')).bind(this),
    });
  }

  handleOffer(event) {
    this.props.onChange(event);

    this.setState({
      offerId: this.props.offerId
    });
  }

  render () {
    let offersOptions = this.state.offers.map((offer) =>
      <option key={offer.id} value={offer.id}>{offer.price} - {offer.name} - {offer.first_name} {offer.last_name}</option>
    );

    return(
      <div>
        <div className='form-group'>
          <label>Select Offer</label>

          <div className='input-group'>
            <span className="input-group-addon">
              <span className="glyphicon glyphicon-comment" aria-hidden="true"></span>
            </span>

            <select className="form-control" onChange={this.handleOffer} required={true}>
              <option default>Select offer</option>
              {offersOptions}
            </select>
          </div>
        </div>

        <BookingFormCalendar onChange={this.props.onReservedAtChange} offerId={this.state.offerId} />
      </div>
    );
  }
}
