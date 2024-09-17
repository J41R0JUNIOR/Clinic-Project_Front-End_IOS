exports.hello = async (event) => {
  const response = Message(); 
  return {
    statusCode: 200,
    body: JSON.stringify(response)
  };
};

const Message = () => {
  return {
    message: 'Hello from AWS Lambda',
    number: 42
  };
};