class OffersDropdown extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      offers: []
    };
  }

  componentDidMount() {
    $.ajax({
      url: '/api/v1/offers',
      dataType: 'json',
      cache: false,
      success: function(data) {
        this.setState({offers: data});
      }.bind(this),
      error: function(xhr, status, err) {
        alert('An error occured!!!');
      }.bind(this)
    });
  }

  render () {
    let offersOptions = this.state.offers.map((offer) =>
      <option key={offer.id}>{offer.price} - {offer.name}</option>
    );

    return(
      <div>
        <div className='form-group'>
          <label>Select Offers</label>

          <div className='input-group'>
            <span className="input-group-addon">
              <span className="glyphicon glyphicon-comment" aria-hidden="true"></span>
            </span>

            <select multiple className="form-control">
              {offersOptions}
            </select>
          </div>
        </div>
      </div>
    );
  }
}
