class SearchBar extends React.Component {
  render () {
    return (
      <form action="/search_event" acceptCharset="UTF-8" method="get">
        <input
          type="search"
          name="search"
          placeholder="Search meetings"
          autoComplete="off"
          onChange={(event) => {this.props.onSearchChange(event.target.value)}}
        />
        <button type="submit">Search</button>
      </form>
    );
  }
}
