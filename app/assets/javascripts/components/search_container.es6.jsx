class SearchContainer extends React.Component {
  constructor(props) {
    super(props)

    this.state = {term: '', meetings: []}
  }

  search(term) {
    this.setState({term})

    $.ajax({
      url: `/search?term=${term}`,
      method: 'GET',
      success: (data) => {
        this.setState({meetings: data})
      }
    })
  }

  renderSearchResults() {
    if (this.state.meetings.length === 0) {
      return
    }
    return(
      <SearchResults meetings={this.state.meetings} />
    )
  }

  render () {
    return (
      <div className="search-container">
        <SearchBar
          term={this.state.term}
          onSearchChange={(term) => {this.search(term)}}
        />
        {this.renderSearchResults()}
      </div>
    )
  }
}
