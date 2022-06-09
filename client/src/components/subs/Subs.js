// import {useState, useEffect} from 'react'
// import axios from axios

// const Subs = ({})=> {
//   const [subs, setSubs] = useState([]) 
//   useEffect( () => {
//     axios.get("/api/Subs")
//     .then( res => {
//       setSubs(res.data)
//     })
//     .catch( err => console.log(err) )
// }, [])

// const addSub =()=> {
//   axios.post('/api/subs', {sub})
//   .then (res => setSubs ([...subs, res.data]))
//   .catch( err => console.log(err))
// }
// return 
// <>
//   <subform addSub ={addSub} />

// </>

// }

// export default Subs
import { useState, useEffect } from 'react';
import axios from 'axios';
import SubForm from './SubForm';

const Subs = ({}) => {
  const [subs, setSubs] = useState([])

  useEffect( () => {
    axios.get('/api/subs')
      .then( res => setSubs(res.data))
      .catch( err => console.log(err) )
  }, [])

  const addSub = (sub) => {
    axios.post('/api/subs', { sub })
      .then( res => setSubs([...subs, res.data ]))
      .catch( err => console.log(err) )
  }

  return (
    <>
      <SubForm addSub={addSub} />
    </>
  )
}

export default Subs;