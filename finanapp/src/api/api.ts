import { PostData } from '@/lib/types'
import axios from 'axios'

const api = import.meta.env.VITE_API_BASE_URL
  const apiUrl = `${api}/login`

export const login = async (email: string, password: string) => {
  const response = await axios.post(apiUrl, { email, password })
  return response.data
}

export const register = async (email: string, password: string) => {
  const response = await axios.post(apiUrl, { email, password })
  return response.data
}
export const getDatas = async (data:string) => {
  const response = await axios.get(`${api}${data}`)
  return response.data
} 

export const postDatas = async (data:PostData) => {
  const response = await axios.post(`${api}/${data.url}`, data)
  return response.data
} 

